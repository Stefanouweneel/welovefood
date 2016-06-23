class UsersController < ApplicationController

  def follow
    user = User.find(params[:user_id])
    user.followers << Follower.find(current_user.id)
    user.save

    redirect_to root_path
  end

  def unfollow
    user = User.find(params[:user_id])
    begin
      follower = user.followers.find(current_user.id)
     rescue ActiveRecord::RecordNotFound
      follower = nil
    end
    if follower
      user.followers.delete(follower)
    end

    redirect_to root_path
  end
end
