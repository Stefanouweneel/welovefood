class MainController < ApplicationController

  def index
    @posts = Post.feed_for current_user if current_user
  end

  def profile
    @user = User.find(params[:id])
  end

  def followees
    @users = User.all
  end

  def follow
    user = User.find(params[:user_id])
    user.followers << current_user
    user.save

    redirect_to :back
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

    redirect_to :back
  end

end
