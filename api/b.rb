# module GrapeSampleApp
#   def b_constant
#     "Hello from module GrapeSampleApp - b_constant!"
#   end

  class B < Grape::API
    puts caller
    version 'v1', using: :header, vendor: 'geek.co.il'
    format :json

    # helpers do
      def B.b_constant
        "Hello from B!"
      end
    # end

    desc "Invokes class C"

    get :say_b do
      # binding.pry
      p B.b_constant
      C::c_constant
    end
  end
# end
