class User < ApplicationRecord
  has_secure_password
  has_many :questions

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /@/
end
