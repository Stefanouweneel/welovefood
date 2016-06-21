class RegistrationsController < Devise::RegistrationsController

  def edit
  @user = current_user
  end

  def update
  end

  private

  def sign_up_params
  params.require(:user).permit(:name, :description, :email, :password, :password_confirmation, :avatar, :gender, :location)
  end

end
