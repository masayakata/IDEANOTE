class FeedsController < ApplicationController
	def index 
 		@feed_items = current_user.feed.paginate(page: params[:page])
 	end
end
