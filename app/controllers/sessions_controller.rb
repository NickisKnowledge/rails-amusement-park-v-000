class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new', alert: 'There was an error, try again.'
    end
  end

  def delete
    reset_session
    redirect_to root_path
  end
  private
  def session_params
    params.require(:user).permit(:name, :password)
  end
end
