class V1::C < Grape::API
  puts("c.rb loaded! Time: #{Time.now}")

  version 'v1', using: :path
  format :json

  def self.c_constant
    "Hello from C c_constant!"
  end

  desc "Says hello from class C"
  get :say_c do
    p V1::C.c_constant
    "Response from C get :say_c - Hello from C!!!"
  end
end
