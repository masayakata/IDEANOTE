class UsersController < ApplicationController
  prepend_before_action :current_user, only: :exhibit
  before_action :authenticate_user!, except: [:accept, :exhibit]
  respond_to :html, :xml

  def index
    user_session[:cart] = "Cart"
    respond_with(current_user)
  end

  def show
    @user = user.find(params[:id]
      @tweets = @user.tweets.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]
      if @user.update(user_params)
        redirect_to user_show_path(@user)
      else
        render :edit
      end
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)

  def edit_form
    user_session['last_request_at'] = params.fetch(:last_request_at, 31.minutes.ago.utc)
  end

  def update_form
    render (Devise.rails5? ? :body : :text) => 'Update'
  end

  def accept
    @current_user = current_user
  end

  def exhibit
    render (Devise.rails5? ? :body : :text) => current_user ? "User is authenticated" : "User is not authenticated"
  end

  def expire
    user_session['last_request_at'] = 31.minutes.ago.utc
    render (Devise.rails5? ? :body : :text) => 'User will be expired on next request'
  end
end
