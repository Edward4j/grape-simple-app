class V1::A < Grape::API
  puts("a.rb loaded! Time: #{Time.now}")

  version 'v1', using: :path
  format :json

  desc "Invokes class B"

  get :say_a do
    # binding.pry
    V1::B::b_constant
  end
end
