class EntrepreneursController < ApplicationController
  before_action :set_entrepreneur, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @entrepreneurs = Entrepreneur.all
   
  end

  def new
    @entrepreneur = Entrepreneur.new
  end

  def create


  	@entrepreneur = Entrepreneur.new(entrepreneur_params)
  	@entrepreneur.save

  	redirect_to entrepreneurs_path(@entrepreneur)

    
  end


  def show
  	
  end

  def edit
    @entrepreneur = Entrepreneur.find params[:id]
    
  end

  def update
    @entrepreneur = Entrepreneur.find params[:id]
    if @entrepreneur.update(entrepreneur_params)

      redirect_to entrepreneurs_path
      else
        render 'edit'
     end
  end

  def destroy
    
    @entrepreneur.delete

    redirect_to entrepreneurs_path
  end

  def entrepreneur_params
  	params.require(:entrepreneur).permit(:title, :text, :image)
  end

  def set_entrepreneur
    @entrepreneur = Entrepreneur.find params[:id]
  end
end
