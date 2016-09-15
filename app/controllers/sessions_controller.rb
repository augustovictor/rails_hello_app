class SessionsController < ApplicationController
  def new
  end

  def create
    # Instance variable
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user): forget(@user)
      redirect_back_or @user
    else
      # Unlike the contents of flash, the contents of flash.now disappear
      # as soon as there is an additional request
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
