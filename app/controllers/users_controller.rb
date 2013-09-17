class UsersController < ApplicationController

  def index
    @users = User.joins(:license)
    @users = @users.where(licenses: {state: "WA"})
  end

  def new
    @user = User.new
    @user.build_license
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

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User successfully deleted."
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, license_attributes: [:number, :state])
  end

end
