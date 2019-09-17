require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("pdf_form") do |ext|
  ext.lib_dir = "lib/pdf_form"
end

task :default => [:clobber, :compile, :spec]
