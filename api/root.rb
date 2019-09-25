class Root < Grape::API
  format :json

  before do
    header['Access-Control-Allow-Origin']   = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  Dir["#{Application::Path::api}/**/*.rb"].each { |file| require file }

  mount V1::A
  mount V1::B
  mount V1::C
  mount V1::Hello
end
