class UsersController < ApplicationController

  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_session_id] = @user.id
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.where(user_id: @user.id).order("created_at DESC").paginate(page: params[:page], per_page: 8)
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:username,:bio,:email,:password)
  end

end