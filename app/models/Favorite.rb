class Favorite < ActiveRecord::Base
  belongs_to :idea, class_name: "Idea"
  belongs_to :user
  scope :recent, -> { order("id DESC") }
end