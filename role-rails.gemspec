# -*- encoding: utf-8 -*-

require File.expand_path('../lib/role-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name              = "role-rails"
  gem.rubyforge_project = "role-rails"
  gem.version           = RoleRails::VERSION

  gem.authors           = ["Sasha Koss"]
  gem.email             = "koss@nocorp.me"
  gem.date              = "2012-03-23"

  gem.description       = "jQuery plugin to provide easy way to handle DOM elements by role attribute"
  gem.summary           = "jQuery plugin to provide easy way to handle DOM elements by role attribute"
  gem.homepage          = "https://github.com/kossnocorp/role-rails"

  gem.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files             = `git ls-files`.split("\n")
  gem.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.files.reject! { |fn| fn.include? "vendor/role" }

  gem.licenses          = ["MIT"]

  gem.require_paths     = ["lib"]

  gem.rubygems_version  = "1.8.15"

  gem.add_dependency "rails", ">= 3.1.0"

  gem.add_development_dependency "slim", ">= 1.2.0"
  gem.add_development_dependency "skim", ">= 0.8.1"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "shoulda"
  gem.add_development_dependency "bundler", ">= 1.0.0"
end
