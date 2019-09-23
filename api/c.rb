# module GrapeSampleApp
#   def c_constant
#     "Hello from module GrapeSampleApp - c_constant!"
#   end

  class C < Grape::API
    # puts caller
    version 'v1' #, using: :header, vendor: API_VENDOR # 'geek.co.il'
    format :json

    # helpers do
      def C.c_constant
        "Hello from C c_constant!"
      end
    # end

    desc "Says hello from class C"
    get :say_c do
      p C.c_constant
      "Response from C get :say_c - Hello from C!!!"
    end
  end
# end
