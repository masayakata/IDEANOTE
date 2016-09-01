class User < ActiveRecord::Base
	mount_uploader :image, ImageUploader
  has_many :favorites
	has_many :ideas
	has_many :comments
	has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  # ユーザーのステータスフィードを返す
  def feed
    Idea.where("user_id IN (:following_ids) OR user_id = :user_id",
                    following_ids: following_ids, user_id: id)
  end

  def favo(idea)
    favorites.create(idea_id: idea.id)
  end

  def unfavo(idea)
   favorites.find_by(idea_id: idea.id).destroy
  end

  def favoed?(idea)
    favorites.where(idea_id: idea.id).present?
  end
end
