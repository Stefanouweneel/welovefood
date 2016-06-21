class MainController < ApplicationController

  def feed
    @posts = Post.all
  end

  def profile
    @users = User.where(email: current_user.email)
  end

  def edit
  end

end
