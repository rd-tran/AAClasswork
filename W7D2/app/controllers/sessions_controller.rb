class SessionsController < ApplicationController
  before_action :ensure_logged_out, except: :destroy
  before_action :require_login, only: :destroy

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
    )

    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["Wrong email and/or password, try again"]
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

end
