module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      defined?(Slim::Parser) && Slim::Parser.default_options[:shortcut].try(:[]=, '@', 'div role')
    end
  end
end
