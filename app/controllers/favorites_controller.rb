class FavoritesController < ApplicationController
	before_action :user_signed_in?
	def index
		@favorites = current_user.favorites.recent.paginate(:page => params[:page], :per_page => 12)
	end

 	def create
    	@idea = Idea.find(params[:idea_id])
    	current_user.favo(@idea)
     	respond_to do |format|
      		format.html { redirect_to @idea }
      		format.js
   	 	end
  	end

  	def destroy
   	 	@idea = Favorite.find(params[:id]).idea
   	 	current_user.unfavo(@idea)
    	respond_to do |format|
      		format.html { redirect_to @idea }
      		format.js
    	end
  	end
end
