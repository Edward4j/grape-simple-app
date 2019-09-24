require_relative 'a'
require_relative 'b'
require_relative 'c'
require_relative 'hello'

class Root < Grape::API
  extend ActiveSupport::Autoload

  version 'v1', using: :path
  format :json
  # prefix :api

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount A => '/'
  mount B, to: '/'
  mount C, to: '/'
  mount Hello => '/v1'
  # add_swagger_documentation
end
