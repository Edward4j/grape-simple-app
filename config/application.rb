require 'active_support/dependencies'

Bundler.require :default, ENV['RACK_ENV']

ActiveSupport::Dependencies.autoload_paths += ["#{Application::Path::api}"]

# set up Rack application
Application::app = Rack::Builder.new do
  # set up client serving from static files 
  use Rack::TryStatic,
    :root => "#{Application::Path::client}",
    :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

  # mount API classes under a single namespace 
  # (APIs should use :prefix to make sure they don't overlap)
  class ApplicationAPI < Grape::API

    # path_to_root = "#{Application::Path::api}/root.rb"
    #
    # autoload(File.basename(path_to_root).split(".").first.capitalize.to_sym, path_to_root)

    mount(Root, to: '/')
    # mount(Root, to: '/v1')
    # mount(Root, to: '/api')

    # scan api directory for API classes
    # Dir["#{Application::Path::api}/**/*.rb"].each do |file|
    #   existing_classes = ObjectSpace.each_object(Class).to_a # snapshot current class list before
    #   load file # we load the API source file
    #
    #   # then figure what API class was loaded
    #   (ObjectSpace.each_object(Class).to_a - existing_classes).find_all(&:name).each do |clazz|
    #     next unless clazz < Grape::API # ignore non-API classes loaded
    #     next if clazz.nil? # sanity check
    #     mount clazz
    #   end
    # end
  end
  
  map "/api" do
    # ApplicationAPI.compile
    # run Rack::Cascade.new [Root]
    # binding.pry
    run ApplicationAPI
    # run Root
  end
end
