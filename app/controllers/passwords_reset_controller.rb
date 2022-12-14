class PasswordsResetController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      #  Send an email with a reset password link.
      PasswordMailer.with(user: @user).reset.deliver_later()
    end

    redirect_to(root_path, notice: "Check your email for a reset password link")
  end


  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: "Your token has expired, Please try again"
  end

  def update
    puts "--------> #{params[:token]}"
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to(login_path, notice: "Your password was reset successfully. Please sign in")
    else
      render(:edit)
    end
  end


  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end