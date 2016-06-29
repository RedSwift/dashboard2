class Question < ApplicationRecord
  belongs_to :user

  validates :questions, presence: true
end
