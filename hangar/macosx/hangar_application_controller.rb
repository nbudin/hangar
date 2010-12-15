require 'rack_url_protocol'
require 'yaml'
require 'rubygems'
require 'rack'
require 'rack/builder'

module Hangar
  class ApplicationController
    attr_accessor :webView
	
	def resources_dir
  	  NSBundle.mainBundle.resourcePath.fileSystemRepresentation
	end

    def awakeFromNib
	  config_file = File.join(resources_dir, "config", "hangar.yml")
	  if File.exist?(config_file)
		@config = YAML.parse_file(File.join(config_dir, "hangar.yml"))
	  else
	    @config = {}
	  end
	  
	  rack_config = File.join(resources_dir, "config.ru")
	  @app, @options = Rack::Builder.parse_file(rack_config)
	  	
      RackURLProtocol.register("rack", withRackApplication: @app)
      webView.mainFrameURL = "rack:///"
    end
  
    def applicationShouldTerminateAfterLastWindowClosed(application)
	  true
    end
  end
end
