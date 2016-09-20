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

   delete '/tip/:id/delete' do
     #Flash message: Are you sure you want to delete this tip? Yes or Go back
     if logged_in?(session)
       tip = Tip.find_by(id: params[:id])
       tip.delete
       redirect "/user"
     else
       redirect "/login"
     end
   end

 end
