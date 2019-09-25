module V1
  class A < Grape::API
    puts "a.rb loaded! Time: #{Time.now}"
    version 'v1', using: :path
    format :json

    desc "Invokes class B"

    get :say_a do
      # binding.pry
      B::b_constant
    end
  end
end
