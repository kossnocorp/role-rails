require 'rails'

module RoleRails
  class Engine < ::Rails::Engine
    initializer "role-rails.register" do |app|
      if defined?(Slim::Parser)
        shortcut = Slim::Parser.default_options[:shortcut] || {}
        Slim::Parser.default_options[:shortcut] = shortcut.merge('@' => 'div role')
      end
    end
  end
end
