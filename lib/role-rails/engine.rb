module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        Slim::Parser.send(slim_options)[:shortcut].try(:[]=, '@', :attr => 'role')
      end

      if defined?(Slim::Engine)
        Slim::Engine.send(slim_options)[:merge_attrs].try(:[]=, 'role', ' ')
      end
    end

    def slim_options
      Slim::VERSION.to_i >= 3 ? "options" : "default_options"
    end
  end
end
