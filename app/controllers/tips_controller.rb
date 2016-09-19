class TipsController < ApplicationController

   get '/:id/edit' do
     @tip = Tip.find_by(id: params[:id])
      erb :"/tip/show"
   end
end
