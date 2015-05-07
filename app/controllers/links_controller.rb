class LinksController < ApplicationController
	def index
		@link  = Link.new
		@links = Link.all
	end

	def show
		@link = Link.find(params[:id])
		redirect_to @link.url
	end

	def create
		@link = Link.new(links_params)
		if @link.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	private 

	def links_params
		params.require(:link).permit(:url)
	end
end
