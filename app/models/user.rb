class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 15 }
  validates :email, presence: true
  validates :email,format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: { in: 8..32 } 
  validates :password_confirmation, length: { in: 8..32 }   
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
   
   #VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
   ##validates :password,  format: { with: VALID_PASSWORD_REGEX}
   
  has_secure_password
end
