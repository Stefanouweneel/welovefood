class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :favorites

  scope :feed_for, -> (user) do
    order(created_at: :desc).where(user: user.followings)
  end
  
end
