module V1
  class B < Grape::API
    # puts caller
    version 'v1', using: :path
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
end
