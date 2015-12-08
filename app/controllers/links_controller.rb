class LinksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :set_link, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
  end

  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
			redirect_to("/links")
		else
			render :new
		end
  end

  private 

  def set_link
		@link = Link.find(params[:id])
	end

	def link_params
		params.require(:link).permit(:id, :title, :url, :user_id)
	end
end
