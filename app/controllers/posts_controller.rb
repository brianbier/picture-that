class PostsController < ApplicationController
  
  def index
    @post = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
    @user = current_user
  end

  def create
    if params["post"]["body"] == ""
      redirect_to root_path
    else
      @post = Post.new(post_params)
      if logged_in?
        @post.user_id = current_user.id
        if @post.save
          @image_results = Post.bing_search(@post)   
          Image.image_saver(@image_results,@post.id, @post.user_id)
          @user = current_user
          render 'show'
        end
      else
        @user = current_user
        @image_results = Post.bing_search(@post)
        render 'show'
      end
    end
  end

  def show
    @post = Post.new
    @user = current_user
  end

private

  def post_params
    params.require(:post).permit(:body)
  end

end
