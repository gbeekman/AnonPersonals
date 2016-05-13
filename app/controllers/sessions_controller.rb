class SessionsController < ApplicationController

  def new

  end

  def create

    user = User.find_by(username: params[:user][:username])

    if  user && user.valid_password?(params[:user][:password])
      sign_in(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Invalid Input"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
