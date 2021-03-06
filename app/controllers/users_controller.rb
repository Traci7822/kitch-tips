class UsersController < ApplicationController

  get '/user' do
    if logged_in?(session)
      @user_tips = []
      @user = current_user(session)
      Tip.all.each do |tip|
        if tip.user_id == @user.id
          @user_tips << tip
        end
      end
      erb :"/user/profile"
    else
      erb :login
    end
  end

  get '/new' do
    erb :"/tip/new"
  end

  post '/new' do
    if params_blank?(params)
      #look at throwing a flash message here "Field cannot be blank, try again"
      redirect '/new'
    elsif
      Tip.find_by(:name => params[:name])
      #Flash message: tip already exists, view tip or rename
      redirect '/new'
    else
      tip = Tip.create(name: params[:name], main_ingredient: params[:main_ingredient], tip: params[:tip], user_id: session[:user_id])
      redirect "/user"
    end
  end

end
