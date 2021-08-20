class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: :my_listings 
  after_action :verify_policy_scoped, only: :my_listings

  def show
    @user = User.find(params[:id])
    authorize @user

  end

  def edit
    @user = User.find(params[:id])
    
    authorize @user
  end

  def update
    @user = User.find(params[:id])

    authorize @user

    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def my_listings
    @listings = policy_scope(VideoGame)
    

    @my_listings = @listings.select do |list|
      list.user == current_user
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :about)
  end
end
