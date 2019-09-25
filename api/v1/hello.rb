module V1
  class Hello < Grape::API
    puts "hello.rb loaded! Time: #{Time.now}"
    # version 'v1', using: :header, vendor: 'geek.co.il'
    format :json
    
    desc "Says hello"

    get :hello do
      # binding.pry
      "Hello World!"
    end
  end
end
