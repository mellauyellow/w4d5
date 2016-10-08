class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])

    if @user
      login(@user)
      redirect_to subs_url
    else
      flash[:errors] = ["Username or password invalid"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
