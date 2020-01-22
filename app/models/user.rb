class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_items
  has_many :items, through: :user_items
  has_many :friendships
  has_many :friends, through: :friendships
  def self.search(param)
  	param.strip!
  	param.downcase!
  	to_send_back = (email_matches(param)).uniq
  	return nil unless to_send_back
  	to_send_back
  end
  def self.email_matches(param)
    matches('email', param)
  end
  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end
  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end
  def not_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count < 1
  end
  def not_subscribe_with?(item_id)
    user_items.where(item_id: item_id).count < 1
  end
end
