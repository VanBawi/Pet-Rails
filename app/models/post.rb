class Post < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    has_one_attached :picture
    has_many_attached :images
    # belongs_to :user
    
end
