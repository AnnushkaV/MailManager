class Message < ActiveRecord::Base
  belongs_to   :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :recipient_id, presence: true
end
