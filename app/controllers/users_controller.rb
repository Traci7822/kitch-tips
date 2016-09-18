class UsersController < ApplicationController

  get '/user' do
    erb :"/user/profile"
  end
  
end
