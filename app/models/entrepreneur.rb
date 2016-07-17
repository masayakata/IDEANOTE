class Entrepreneur < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :comments, dependent: :destroy
	belongs_to :user
end
