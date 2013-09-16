class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "New user successfully created."
      redirect_to root_url
    else
      flash[:notice] = @user.errors.full_messages
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
