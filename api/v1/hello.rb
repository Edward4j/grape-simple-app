class V1::Hello < Grape::API
  puts("hello.rb loaded! Time: #{Time.now}")

  version 'v1', using: :path
  format :json

  desc "Says hello"

  get :hello do
    "Hello World!"
  end
end
