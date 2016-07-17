class WelcomeController < ApplicationController
	def index
	end

  def new
  end

  def create
  	@entrepreneur = Entrepreneur.new(entrepreneur_params)
  	@entrepreneur.save

  	redirect_to new_user_registration_path (@entrepreneur)

    @entrepreneur.user = current_user
  end


  def show
  	@entrepreneur = Entrepreneur.find params[:id]
  end

  def edit
  end

  def entrepreneur_params
  	params.require(:entrepreneur).permit(:title, :text, :image)
  end
end
