# encoding: utf-8

require 'rubygems'
require 'bundler'

$:.push File.expand_path('../lib', __FILE__)
require 'role-rails/version'


begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = 'role-rails'
  gem.homepage = "https://github.com/kossnocorp/role-rails"
  gem.license = "MIT"
  gem.summary = 'jQuery plugin to provide easy way to handle DOM elements by role attribute'
  gem.description = 'jQuery plugin to provide easy way to handle DOM elements by role attribute'
  gem.email = 'koss@nocorp.me'
  gem.authors = ['Sasha Koss']
  gem.rubyforge_project = 'role-rails'
  gem.version = RoleRails::VERSION
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = RoleRails::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "role-rails #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
