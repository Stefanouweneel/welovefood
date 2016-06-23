class User < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :followers, join_table: :followers_users
end
