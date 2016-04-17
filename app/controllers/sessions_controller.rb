class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_session_id] = user.id
      redirect_to user
    else
      @errors = 'Wrong email or Password'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email,:password)
  end

end