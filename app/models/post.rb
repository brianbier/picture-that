class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :body, presence: true, length: { maximum: 100 }


  def self.bing_search(post)
    image_results = []
    words = post.body.split(' ')
    bing = Bing.new(ENV["BING_SEARCH"],6,"Image")
    words.each do |word|
      bing_search_results = bing.search(word)
      image_count = bing_search_results[0][:Image].count
      random = rand(image_count)
      if image_count == 0
        image_url = 'https://avatars0.githubusercontent.com/u/11370144?v=3&s=460'
      else
        image_url = bing_search_results[0][:Image][random][:MediaUrl].to_s
      end
      image_results.push(image_url)
    end
    return image_results
  end

end