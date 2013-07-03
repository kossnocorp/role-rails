module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        Slim::Parser.default_options[:shortcut].try(:[]=, '@', :attr => 'role')
      end

      if defined?(Slim::Engine)
        Slim::Engine.default_options[:merge_attrs].try(:[]=, 'role', ' ')
      end
    end
  end
end
