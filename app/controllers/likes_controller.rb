class LikesController < ApplicationController
	before_action :ramen_params
 def create
   Like.create(user_id: current_user.id, ramen_id: params[:id])
 end
 
 def destroy
   Like.find_by(user_id: current_user.id, ramen_id: params[:id]).destroy
  end
 
 private
 
 def ramen_params
   @ramen = Ramen.find(params[:id])
 end
end
