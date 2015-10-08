class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets, dependent: :destroy
  has_many :comments, through: :tweets, dependent: :destroy
end
