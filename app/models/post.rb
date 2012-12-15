class Post < ActiveRecord::Base
  attr_accessible :post, :title, :user, :user_id, :likes, :link, :admin, :promoted
  belongs_to :user
  has_many :votes
  scope :short, where('length(post) < ?', 100)
  
end
