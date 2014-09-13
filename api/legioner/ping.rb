module Legioner
  
  class Ping < Grape::API
    
    version 'v1', :using => :header, :vendor => 'showbox', :format => :json
    resource :system do
      
      desc "Answers a ping"
      get :ping do
        "pong"
      end
      
    end
       
  end
  
end
