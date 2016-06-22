class RegistrationsController < Devise::RegistrationsController

  def edit
  @user = current_user
  end

  def update
  @user = User.find(current_user.id)
    if @user.update(sign_up_params)
      flash[:notice] = "Your profile has been updated"
      redirect_to profile_path
    else
      render "edit"
    end
  end

  private

  def sign_up_params
  params.require(:user).permit(:name, :description, :email, :avatar, :gender, :location)
  end

end
