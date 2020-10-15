class User < ApplicationRecord
  RULE =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: {with: RULE}
  validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, length: { in: 8..32 }   
   
   #VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
   ##validates :password,  format: { with: VALID_PASSWORD_REGEX}
   
  has_secure_password
  
  has_many :topics
  has_many :comments
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end

