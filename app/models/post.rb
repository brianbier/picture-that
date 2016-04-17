class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :body, presence: true, length: { maximum: 100 }
end