class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :post


def self.image_saver(image_list, post_id, user_id)
  image_list.each do |image|
    Image.create(content: image, post_id: post_id, user_id: user_id)
  end
end
end