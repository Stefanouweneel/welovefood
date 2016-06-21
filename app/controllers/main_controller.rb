class MainController < ApplicationController

  def feed
    @posts = Post.all
    if user_signed_in?
      @followers = current_user.followers
    end
  end

end
