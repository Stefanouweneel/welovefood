class Follower < ActiveRecord::Base
  self.table_name = :users
   has_and_belongs_to_many :users, join_table: :followers_users
end
