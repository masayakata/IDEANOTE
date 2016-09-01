class Idea < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	
	has_many :comments, dependent: :destroy
	has_many :favorites
	belongs_to :user
	scope :recent, -> { order("id DESC") }
end
