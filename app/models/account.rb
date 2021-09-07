class Account < ApplicationRecord
  
  
  validates :name, :presence => true
  validates :username, :presence => true
  validates :email, :presence => true
  
  acts_as_voter
  has_one_attached :image 
  
  has_many :accountposts ,dependent: :destroy
  has_many :stories ,dependent: :destroy
  has_many :comments ,dependent: :destroy
  
  has_many :followed_accounts, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_accounts
  has_many :following_accounts, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_accounts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
