class Comment < ActiveRecord::Base
  belongs_to :idea, :counter_cache => :comments_count
  belongs_to :user
end
