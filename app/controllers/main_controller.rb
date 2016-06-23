class MainController < ApplicationController

  def index
      @posts = Post.order('created_at desc')
  end

  def profile
    @user = User.find(params[:id])
  end

  def followees
    @users = User.all
  end

  def follow
    user = User.find(params[:user_id])
    user.followers << Follower.find(current_user.id)
    user.save

    redirect_to followees_path
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

    redirect_to followees_path
  end

end
