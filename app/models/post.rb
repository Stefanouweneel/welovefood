class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  scope :feed_for, -> (user, search) do
    user.followings << user
    order(created_at: :desc).where(user: user.followings).where("title LIKE ? OR description LIKE ?",
      "%#{search}%", "%#{search}%")
  end

  def self.search(search)
  where("title LIKE ? OR description LIKE ?",
    "%#{search}%", "%#{search}%")
  end

end
