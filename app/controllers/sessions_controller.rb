
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Successfully logged In"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
