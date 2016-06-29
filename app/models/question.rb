class Question < ApplicationRecord
  belongs_to :user

  validates :questions, :title, presence: true
end
