class User < ApplicationRecord
  has_secure_password
  has_many :questions
  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/, message: "must have format abc@abc.com"
  validates :password, length: { minimum: 4, message: "minimum 4 characters long" }
end
