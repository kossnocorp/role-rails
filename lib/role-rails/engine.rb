module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        Slim::Parser.options[:shortcut].try(:[]=, '@', :attr => 'role')
      end

      if defined?(Slim::Engine)
        Slim::Engine.options[:merge_attrs].try(:[]=, 'role', ' ')
      end
    end
  end
end
