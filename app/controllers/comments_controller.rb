class CommentsController < ApplicationController

	def create
		@idea = Idea.find params[:idea_id]
		@idea.comments.create(comment_params)
		redirect_to idea_path(@idea)
	end



	def destroy
		@idea = Idea.find params[:idea_id]
		@comment = @idea.comments.find params[:id]
		@comment.destroy

		redirect_to idea_path(@idea)
	end

	def comment_params
		params.require(:comment).permit(:body, :commenter)
	end
	
end
