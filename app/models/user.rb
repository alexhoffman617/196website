class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :vvotes
  attr_accessible :bio, :email, :name, :admin, :promoted
  has_many :posts
  has_many :votes
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :name, :presence => true
  validates :name, :uniqueness => true

  

end
