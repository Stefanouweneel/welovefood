class MainController < ApplicationController

  def feed
    @posts = Post.all
  end

end
