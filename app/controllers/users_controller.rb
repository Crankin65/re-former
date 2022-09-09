class UsersController < ApplicationController
  def new
  end

  def create
   @user = User.new(username: params[:username], email: params[:email], password: params[:password])
  # @user = User.new(user_params)

    if @user.save
      #flash[:success] = "Great! Your post has been created!"
      redirect_to new_user_path
    else
      #flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end
end
