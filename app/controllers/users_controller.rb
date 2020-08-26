class UsersController < ApplicationController
  def top
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
  end
end
