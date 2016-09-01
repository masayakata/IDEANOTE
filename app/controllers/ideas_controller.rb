class IdeasController < ApplicationController
  before_action :set_idea, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    if params[:genre].present?
      @ideas = Idea.where(genre: params[:genre]).recent.paginate(:page => params[:page], :per_page => 12)
    elsif  params[:q].present?
     @ideas = Idea.where("title LIKE '%"+params[:q]+"%'").recent.paginate(:page => params[:page], :per_page => 12)
    else 
      @ideas = Idea.recent.paginate(:page => params[:page], :per_page => 12)
    end
  end

  def new
    @idea = Idea.new
  end

  def create
  	@idea = Idea.new(idea_params)
  	@idea.save

  	redirect_to ideas_path(@idea)

    
  end


  def show
  	@comments = @idea.comments
    @idea.increment(:pv)
    @idea.save
  end

  def edit
    @idea = Idea.find params[:id]
    
  end

  def update
    @idea = Idea.find params[:id]
    if @idea.update(idea_params)

      redirect_to ideas_path
      else
        render 'edit'
     end
  end

  def destroy
    
    @idea.delete

    redirect_to ideas_path
  end

  def idea_params
  	params.require(:idea).permit(:title, :text, :image, :user_id, :genre)
  end

  def set_idea
    @idea = Idea.find params[:id]
  end
end
