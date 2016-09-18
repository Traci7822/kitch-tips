require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "kitchtipsaregreat"
  end

  include Validify::InstanceMethods

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    if user_params_blank?(params)
      #look at throwing a flash message here "Field cannot be blank, try again"
      redirect '/signup'
    elsif
      User.find_by(:email => params[:email])
      #Flash message: "User with this email address already exists, try again"
      redirect '/signup'
    else
      user = User.create(name: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect "/tips"
    end
  end

end
