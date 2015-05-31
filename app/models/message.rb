class Message < ActiveRecord::Base
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }
  validates :sender_id, presence: true
  validates :recipient_id, presence: true

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end
end
