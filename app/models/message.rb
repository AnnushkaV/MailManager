class Message < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 140 }
  validates :sender_id, presence: true
  validates :recipient_id, presence: true
end
