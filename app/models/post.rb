class Post < ActiveRecord::Base
  attr_accessible :post, :title, :user, :user_id
  belongs_to :user
  
  scope :short, where('length(post) < ?', 100)
  
end
