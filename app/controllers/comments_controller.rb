class CommentsController < ApplicationController
	def create
		@entrepreneur = Entrepreneur.find params[:entrepreneur_id]
		@entrepreneur.comments.create(comment_params)
		redirect_to entrepreneur_path(@entrepreneur)
	end

	def destroy
		@entrepreneur = Entrepreneur.find params[:entrepreneur_id]
		@comment = @entrepreneur.comments.find params[:id]
		@comment.destroy

		redirect_to entrepreneur_path(@entrepreneur)
	end

	def comment_params
		params.require(:comment).permit(:body, :commenter)
	end
end
