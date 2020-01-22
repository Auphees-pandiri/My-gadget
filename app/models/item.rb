class Item < ApplicationRecord
	has_many :user_items
  	has_many :users, through: :user_items
	def self.search(param)
		param.strip!
		param.downcase!
		to_send_back = (name_matches(param)).uniq
		return nil unless to_send_back
		to_send_back
  	end
  	def self.name_matches(param)
    	matches('name', param)
  	end
	def self.matches(field_name, param)
		where("#{field_name} like ?", "%#{param}%")
	end
end
