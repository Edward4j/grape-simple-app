module GrapeSampleApp
  class A < Grape::API
    puts caller
    version 'v1', using: :header, vendor: 'geek.co.il'
    format :json

    desc "Invokes class B"

    get :say_a do
      # binding.pry
      B::b_constant
    end
  end
end
