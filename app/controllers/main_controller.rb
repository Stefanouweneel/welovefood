class MainController < ApplicationController

  def feed
    @posts = Post.all
    if user_signed_in?
      @followers = current_user.followers
    end
  end

  def profile
    @users = User.where(email: current_user.email)
  end

  def edit
  end

end
