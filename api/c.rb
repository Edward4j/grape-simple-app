class C < Grape::API
  version 'v1', using: :path #, using: :header, vendor: API_VENDOR # 'geek.co.il'
  format :json

  def C.c_constant
    "Hello from C c_constant!"
  end

  desc "Says hello from class C"

  get :say_c do
    p C.c_constant
    "Response from C get :say_c - Hello from C!!!"
  end
end
