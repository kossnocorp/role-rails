#!/usr/bin/env rake
require "bundler/gem_tasks"

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

namespace :role do

  desc "Pull role/master subtree."
  task :pull do
    if !system "git pull -s subtree role master"
      abort("Have to add role remote `git remote add -f role git@github.com:kossnocorp/role.git`")
    end
  end

  desc "Update role assets."
  task :update => "role:pull" do
    Dir["vendor/role/lib/*role.js"].each do |f|
      cp f, "vendor/assets/javascripts/"
    end
  end
end
