class UsersController < ApplicationController
  before_filter :require_signed_in

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
    end

  end

  private

  def user_params
    params.require(:user).permit(:password, :username, :email)
  end

end
