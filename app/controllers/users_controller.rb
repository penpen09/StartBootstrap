class UsersController < ApplicationController
  def top
  end

  def show
    @user = User.find(params[:id])
    # @blogs = @user.favorites
    @favorites = current_user.favorites
    # @login_user_blogs = current_user.blogs
    @favorited_total_counts = Favorite.joins(:blog).where(blogs: {user_id: current_user.id}).count
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
