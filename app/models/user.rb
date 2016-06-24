class User < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :followings,
    join_table: :followers_users,
    foreign_key: :follower_id,
    class_name: User

  has_and_belongs_to_many :followers,
    join_table: :followers_users,
    association_foreign_key: :follower_id,
    class_name: User

  has_many :posts
end
