Bundler.require :default, ENV['RACK_ENV']

# set up Rack application
Application::app = Rack::Builder.new do
  # set up client serving from static files 
  use Rack::TryStatic,
    :root => "#{Application::Path::client}",
    :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

  # map API classes to /api URLS
  Dir["#{Application::Path::api}/**/*.rb"].each do |file|
    existing_classes = ObjectSpace.each_object(Class).to_a # snapshot current class list before
    load file # we load the API source file
    
    # then figure what API class was loaded
    clazz = (ObjectSpace.each_object(Class).to_a - existing_classes).
      find_all(&:name). # get all new class objects
      select { |c| c < Grape::API }. # ignore non-API classes loaded
      first # only one API class can be mapped to a single URL
    # also having multiple classes in a file is bad practice so we don't support that
    # but if you do that, there's no tell which class will be listed here.
      
    next if clazz.nil? # sanity check
    uripath = "/api/" + file.gsub(/\.rb$/,"").gsub(%r{^#{Application::Path::api}/?},"")
    puts "Registering #{clazz} for #{uripath}" 
    map uripath do
      run clazz
    end
  end
end
