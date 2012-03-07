# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run SameTut::Application



Encoding.default_external = "UTF-8"
