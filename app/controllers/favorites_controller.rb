class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  def create

    post = Post.find( params[:post_id] )

    if favorite = Favorite.find_by( post: post, user: current_user )
      favorite.destroy
    else
      favorite = Favorite.new( post: post, user: current_user )
      favorite.save
    end

    redirect_to feedfood_path
  end

end
