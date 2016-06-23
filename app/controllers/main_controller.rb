class MainController < ApplicationController

  def index
    @posts = Post.order('created_at desc')
  end

  def profile
    @users = User.where(email: current_user.email)
  end

  def edit
  end

end
