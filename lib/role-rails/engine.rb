require 'rails'

module Role
  module Rails
    class Engine < ::Rails::Engine
      initializer "role-rails.register" do |app|
        if defined?(Slim::Engine)
          Slim::Engine.default_options[:shortcut] = {'#' => 'div id', '.' => 'div class', '@' => 'div role'}
        end
      end      
    end
  end
end
