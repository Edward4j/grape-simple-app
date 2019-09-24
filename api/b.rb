class B < Grape::API
  version 'v1', using: :path #, using: :header, vendor: API_VENDOR # 'geek.co.il'
  format :json

  def B.b_constant
    "Hello from B!"
  end

  desc "Invokes class C"

  get :say_b do
    # binding.pry
    p B.b_constant
    C::c_constant
  end
end
