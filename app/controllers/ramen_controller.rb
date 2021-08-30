class RamenController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_ramen, only: [:show, :edit, :update,:destroy]
	before_action :move_to_edit, only: [:edit,:update]

	def index
		@ramen = Ramen.all.order("created_at DESC")
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
		@comment = Comment.new
		@comments = @ramen.comments.includes(:user)
	end
	def edit
	end
	def update
		if @ramen.update(ramen_params)
			redirect_to raman_path
		else
			render :edit
		end
	end
	def destroy
		@ramen.destroy
		redirect_to root_path
	end
	private
	def ramen_params
		params.require(:ramen).permit(:store_name,:ramen_name,:star_id, :image,:text).merge(user_id: current_user.id)
	end
	def set_ramen
		@ramen = Ramen.find(params[:id])
	end
	def move_to_edit
    unless current_user.id == @ramen.user_id
      redirect_to root_path
    end
	end
end
