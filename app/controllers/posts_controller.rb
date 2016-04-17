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
        Image.image_saver(@image_results,@post.id, @post.user_id)
        @user = current_user
        render 'index'
      end
    else
      @user = current_user
      @image_results = Post.bing_search(@post)
      render 'index'
    end
  end

private

  def post_params
    params.require(:post).permit(:body)
  end

end
