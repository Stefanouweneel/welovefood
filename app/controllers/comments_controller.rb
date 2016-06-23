class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create

    post = Post.find( params[:post_id] )
    comment = Comment.new(post: post, user: current_user, comment: params[:comment])

    comment.save

    redirect_to feed_path
  end

end
