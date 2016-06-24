class Post < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(search)
  where("title LIKE ? OR description LIKE ?",
    "%#{search}%", "%#{search}%")
  end
end
