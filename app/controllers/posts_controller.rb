class PostsController < ApplicationController
  
  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if logged_in?
      @post.user_id = current_user.id
      if @post.save
        words = @post.body.strip.split(' ')
        @image_results = []
        bing = Bing.new("EmWIQAiZIVXEc4+uWv1fXP3Os0ZnCi042/FWa3wfpRQ",2,"Image")

        words.each do |word_to_search|
          bing_search_results = bing.search(word_to_search)
          image_counter = bing_search_results[0][:Image].count
          random = rand(image_counter)
          if image_counter == 0 
            image_url = 'https://avatars0.githubusercontent.com/u/11370144?v=3&s=460'
          else
            image_url = bing_search_results[0][:Image][random][:mediaUrl].to_s
          end
          @image_results = image_url
        end
      @image_results
      render 'index'
      end
    else
      words = @post.body.split(' ')
        @image_results = []
        bing = Bing.new("EmWIQAiZIVXEc4+uWv1fXP3Os0ZnCi042/FWa3wfpRQ",2,"Image")
        words.each do |word_to_search|
          bing_search_results = bing.search(word_to_search)
          image_counter = bing_search_results[0][:Image].count
          random = rand(image_counter)
          if image_counter == 0 
            image_url = 'https://avatars0.githubusercontent.com/u/11370144?v=3&s=460'
          else
            image_url = bing_search_results[0][:Image][random][:MediaUrl].to_s
          end
          @image_results.push(image_url)
        end
        @image_results
      render 'index'
    end
  end

private

  def post_params
    params.require(:post).permit(:body)
  end

end
