class WelcomeController < ApplicationController
	def index
	end

  def new
  end

  def create
  	@idea = Idea.new(idea_params)
  	@idea.save

  	redirect_to new_user_registration_path (@idea)

    @idea.user = current_user
  end


  def show
  	@idea = Idea.find params[:id]
  end

  def edit
  end

  def idea_params
  	params.require(:idea).permit(:title, :text, :image)
  end
end
