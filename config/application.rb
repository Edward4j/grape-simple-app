require 'active_support/dependencies'

Bundler.require :default, ENV['RACK_ENV']

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.acronym 'V1'
end

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
    # binding.pry
    # ActiveSupport::Dependencies.autoload_paths += ["#{Application::Path::api}", "#{Application::Path::api}/v1"]

    # path_to_root = "#{Application::Path::api}/root.rb"
    #
    # autoload(File.basename(path_to_root).split(".").first.capitalize.to_sym, path_to_root)

    mount(Root, to: '/')

    # scan api directory for API classes
    # Dir["#{Application::Path::api}/**/*.rb"].each do |file|
    #   # binding.pry
    #   existing_classes = ObjectSpace.each_object(Class).to_a # snapshot current class list before
    #   load file # we load the API source file
    #
    #   # then figure what API class was loaded
    #   (ObjectSpace.each_object(Class).to_a - existing_classes).find_all(&:name).each do |clazz|
    #     next unless clazz < Grape::API # ignore non-API classes loaded
    #     next if clazz.nil? # sanity check
    #     # binding.pry
    #     mount clazz
    #   end
    # end
  end
  
  map "/api" do
    # binding.pry
    # ApplicationAPI.compile
    run ApplicationAPI
  end
end
