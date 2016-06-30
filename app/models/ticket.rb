class Ticket < ApplicationRecord
  belongs_to :user
  validate :post_limit, :on => :create
  validates :topic, :effective, :prepare, :practice, :info, presence: true

  scope :today, -> { where(:created_at => (Time.now.beginning_of_day..Time.now.end_of_day))}

  def post_limit
    if user.tickets.today.count >= 1
      errors.add(:post, "You can only submit 1 exit ticket a day")
    end
  end
end
