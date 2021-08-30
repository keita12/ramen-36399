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
	def show
		@ramen = Ramen.find(params[:id])
		@comment = Comment.new
		@comments = @ramen.comments.includes(:user)
	end
	def edit
		@ramen = Ramen.find(params[:id])
	end
	def update
		@ramen = Ramen.find(params[:id])
		if @ramen.update(ramen_params)
			redirect_to raman_path
		else
			render :edit
		end
	end
	def destroy
		@ramen = Ramen.find(params[:id])
		@ramen.destroy
		redirect_to root_path
	end
	private
	def ramen_params
		params.require(:ramen).permit(:store_name,:ramen_name,:star_id, :image,:text).merge(user_id: current_user.id)
	end
end
