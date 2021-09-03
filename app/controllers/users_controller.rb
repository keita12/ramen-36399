class UsersController < ApplicationController
	before_action :set_user, only: [:show]
 def show
	@user = User.find(params[:id])
	likes = Like.where(user_id: @user.id).pluck(:ramen_id)
	@like_ramens = Ramen.find(likes)
 end
 

	private
	def set_user
		@user = User.find(params[:id])
	end
end
