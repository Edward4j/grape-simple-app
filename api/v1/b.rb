class V1::B < Grape::API
  puts("b.rb loaded! Time: #{Time.now}")

  version 'v1', using: :path
  format :json

  def self.b_constant
    "Hello from B!"
  end

  desc "Invokes class C"

  get :say_b do
    # binding.pry
    p V1::B.b_constant
    V1::C::c_constant
  end
end
