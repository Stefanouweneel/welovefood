class RegistrationsController < Devise::RegistrationsController

  def edit
  @user = current_user
  end

  def update
  @user = User.find(current_user.id)
    if @user.update(edit_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to profile_path
    else
      render "edit"
    end
  end

  private

  def edit_params
    params[:user].permit(:name, :description, :avatar, :gender, :location)
  end

  def sign_up_params
    params.require(:user).permit(:name, :description, :password, :password_confirmation, :email, :avatar, :gender, :location)
  end

end
