class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   # binding.pry
  #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      #flash[:success] = "Great! Your post has been created!"
      redirect_to new_user_path
    else
      #flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: 422
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: 422
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
