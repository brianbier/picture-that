class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :images
  validates :first_name, :last_name, :username, presence: true
  validates :email, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :password, presence: true
  validates :bio, length: { minimum: 3 }
  validate :email_validator






private

  def email_validator
    unless email && email.match(/[^!@#$%^&*()~]+[^!@#$%^&*()~0.9]+.com/)
      errors.add(:email, 'is not valid')
    end
  end
end