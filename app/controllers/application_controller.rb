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
      #look at throwing a flash message here
      redirect '/signup'
    else
      user = User.create(username: params[:username], email: params[:email], password: params[:password])
    end
  end

end
