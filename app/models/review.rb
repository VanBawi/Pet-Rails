class Review < ApplicationRecord
	validates :pet_id, uniqueness: { scope: :user_id, message: "You've reviewed this post!" }
	belongs_to :pet
	belongs_to :user
end
