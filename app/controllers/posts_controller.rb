class PostsController < ApplicationController
  
  def index
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    if logged_in?
      @post.user_id = current_user.id
      if @post.save
        @image_results = Post.bing_search(@post)   
        render 'index'
      end
    else
      @image_results = Post.bing_search(@post)
      render 'index'
    end
  end

private

  def post_params
    params.require(:post).permit(:body)
  end

end
