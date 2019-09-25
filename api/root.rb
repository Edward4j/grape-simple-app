class Root < Grape::API
  puts("root.rb loaded! Time: #{Time.now}")

  format :json

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  # Dir["#{Application::Path::api}/**/*.rb"].each { |file| require file }

  mount V1::Hello
  mount V1::C
  mount V1::B
  mount V1::A
end
