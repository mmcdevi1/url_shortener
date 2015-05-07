class LinksController < ApplicationController
	def index
		@link  = Link.new
		@links = Link.top_100_clicks
	end

	def show
		@link = Link.find_by_slug(params[:id])
		if redirect_to @link.url
			@link.clicks += 1
			@link.save
		end
	end

	def create
		@link = Link.new(links_params)
		if @link.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private 

	def links_params
		params.require(:link).permit(:url)
	end
end