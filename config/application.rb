Bundler.require :default, ENV['RACK_ENV']
 
require "#{Application::Path::api}/#{Application::name}"

use Rack::TryStatic,
  :root => "#{Application::Path::client}",
  :urls => %w[/], :try => ['.html', 'index.html', '/index.html']
 
run Legioner::Ping
