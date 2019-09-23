# module API
  class Root < Grape::API
    version 'v1'
    format :json
    prefix :api

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    # binding.pry
    # mount GrapeSampleApp::A
    # mount A
    # mount B
    # mount C
    # add_swagger_documentation
  end
# end
