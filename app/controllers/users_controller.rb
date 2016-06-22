class UsersController < ApplicationController

  def follow
    user = User.find(params[:user_id])
    user.followers << Follower.find(current_user.id)
    user.save

    redirect_to feedfood_path
  end
end
