require 'rails'

module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Engine)
        Slim::Engine.default_options[:shortcut] ||= {}
        Slim::Engine.default_options[:shortcut].merge!('@' => 'div role')
      end
    end
  end
end
