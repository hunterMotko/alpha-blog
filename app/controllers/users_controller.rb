class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account info was updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} to the Alpha Blog, successful signup!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end