class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name
  has_many :posts
end
