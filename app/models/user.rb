class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :images
  validates :first_name, :last_name, :username, presence: true
  validates :email, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :password, presence: true, length: { in: 6..8} 
  validates :bio, length: { minimum: 10 }
  validate :email_validator






private

  def email_validator
    unless email && email.match(/[^!@#$%^&*()~]+[^!@#$%^&*()~0.9]+.com/)
      errors.add(:email, 'is not valid')
    end
  end
end