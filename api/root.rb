class Root < Grape::API
  version 'v1', using: :path
  format :json
  # prefix :api

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end

  mount A
  mount B
  mount C
  mount Hello
end
