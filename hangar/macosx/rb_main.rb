#
# rb_main.rb
# MacOnRack
#
# Created by Joshua Peek on 11/20/09.
# Copyright 37signals 2009. All rights reserved.
#

# Loading the Cocoa framework. If you need to load more frameworks, you can
# do that here too.
framework 'Cocoa'
framework 'WebKit'

dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
# Load all the bundled gems
require 'rubygems'
Gem.clear_paths
Gem.path.clear
Dir[File.join(dir_path, "..", "Frameworks", "MacRuby.framework", 
			  "Versions", "*", "usr", "lib", "ruby", "Gems", "*")].each do |dir|
  Gem.path << File.expand_path(dir)
end
puts "Bootstraping Bundler with Gem.path #{Gem.path.inspect}"

ENV['BUNDLE_GEMFILE'] = File.join(dir_path, "Gemfile")
ENV['BUNDLE_PATH'] = File.join(dir_path, "vendor", "bundle", 
							   Gem.ruby_engine, Gem::ConfigMap[:ruby_version])
ENV['BUNDLE_FROZEN'] = "1"
ENV['BUNDLE_ROOT'] = dir_path

require 'bundler'
puts "Bundler lockfile: #{Bundler.default_lockfile}"
puts "Bundler path: #{Bundler.settings.path}"
Bundler.setup
puts "Gem.path after running Bundler setup: #{Gem.path.inspect}"

# Loading all the Ruby project files.
Dir.entries(dir_path).each do |path|
  if path != File.basename(__FILE__) and path.match(/hangar_application_controller\.rbo?$/)
    require(path)
  end
end

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)
