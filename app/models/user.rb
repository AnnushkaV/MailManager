class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many      :sent,
                :class_name => "Message",
                :foreign_key  => "sent_id"

  has_many      :received,
                :class_name => "Message",
                :foreign_key  => "received_id"
end
