module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        Slim::Parser.default_options[:shortcut].try(:[]=, '@', 'role')
      end

      if defined?(Slim::Engine)
        Slim::Engine.default_options[:attr_delimiter].try(:[]=, 'role', ' ')
      end

      if defined?(Haml::Parser)
        module Haml::Parser
          DIV_ROLE = ?@

          private

          original_process_line_method = instance_method :process_line
          define_method :process_line do |text, index|
            if text[0] === DIV_ROLE
              push div(text)
            else
              original_process_line_method.bind(self).call(text, index)
            end
          end

          def self.parse_class_and_id(list)
            attributes = {}
            list.scan(/([#.@])([-:_a-zA-Z0-9]+)/) do |type, property|
              case type
              when '.'
                if attributes['class']
                  attributes['class'] += " "
                else
                  attributes['class'] = ""
                end
                attributes['class'] += property
              when '#'; attributes['id'] = property
              when '@'; attributes['role'] = property
              end
            end
            attributes
          end

          def parse_tag(line)
            raise SyntaxError.new("Invalid tag: \"#{line}\".") unless match = line.scan(/%([-:\w]+)([-:\w\.\#\@]*)(.*)/)[0]

            tag_name, attributes, rest = match
            raise SyntaxError.new("Illegal element: classes and ids must have values.") if attributes =~ /[\.#](\.|#|\z)/

            new_attributes_hash = old_attributes_hash = last_line = nil
            object_ref = "nil"
            attributes_hashes = {}
            while rest
              case rest[0]
              when ?{
                break if old_attributes_hash
                old_attributes_hash, rest, last_line = parse_old_attributes(rest)
                attributes_hashes[:old] = old_attributes_hash
              when ?(
                break if new_attributes_hash
                new_attributes_hash, rest, last_line = parse_new_attributes(rest)
                attributes_hashes[:new] = new_attributes_hash
              when ?[
                break unless object_ref == "nil"
                object_ref, rest = balance(rest, ?[, ?])
              else; break
              end
            end

            if rest
              nuke_whitespace, action, value = rest.scan(/(<>|><|[><])?([=\/\~&!])?(.*)?/)[0]
              nuke_whitespace ||= ''
              nuke_outer_whitespace = nuke_whitespace.include? '>'
              nuke_inner_whitespace = nuke_whitespace.include? '<'
            end

            value = value.to_s.strip
            [tag_name, attributes, attributes_hashes, object_ref, nuke_outer_whitespace,
            nuke_inner_whitespace, action, value, last_line || @index]
          end

        end
      end
    end
  end
end
