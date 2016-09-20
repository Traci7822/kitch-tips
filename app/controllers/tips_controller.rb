class TipsController < ApplicationController

  include Validify::InstanceMethods

   get '/:id/edit' do
     @tip = Tip.find_by(id: params[:id])
      erb :"/tip/show"
   end

   patch '/tip/:id' do
     if logged_in?(session)
       if !params_blank?(params)
         tip = Tip.find_by(id: params[:id])
         tip.update(name: params[:name], main_ingredient: params[:main_ingredient], tip: params[:tip])
         redirect "/user"
       end
     else
       redirect "/login"
     end
   end

 end
