module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        Slim::Parser.default_options[:shortcut].try(:[]=, '@', 'role')
      end

      if defined?(Slim::Engine)
        Slim::Engine.default_options[:attr_delimiter].try(:[]=, 'role', ' ')
      end
    end
  end
end
