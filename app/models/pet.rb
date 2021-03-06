class Pet < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    has_one_attached :picture
    has_many_attached :images

    belongs_to :user
    has_many :rates, foreign_key: :raiter_id
    has_many :rents, foreign_key: :renter_id

    belongs_to :category
    has_many :reviews
    
    mount_uploaders :images, ImageUploader
    mount_uploader :picture, ImageUploader

    
end
