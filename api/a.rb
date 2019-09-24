class A < Grape::API
  version 'v1', using: :path # , using: :header, vendor: API_VENDOR # 'geek.co.il'
  format :json

  desc "Invokes class B"

  get :say_a do
    B::b_constant
  end
end
