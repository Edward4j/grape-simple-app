# module GrapeSampleApp
  
  class Hello < Grape::API
    # puts caller
    version 'v1', using: :header, vendor: 'geek.co.il'
    format :json
    
    desc "Says hello"
    get :hello do
      "Hello World!"
    end
  end
  
# end
