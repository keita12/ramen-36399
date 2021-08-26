class RamenController < ApplicationController
	def index
		@ramen = Ramen.all
	end
	def new
		@ramen = Ramen.new
	end
	def create
		@ramen = Ramen.new(ramen_params)
		if @ramen.save
			redirect_to root_path
		else
      render :new
    end
	end
	private
	def ramen_params
		params.require(:ramen).permit(:store_name,:ramen_name,:star_id, :image).merge(user_id: current_user.id)
	end
end
