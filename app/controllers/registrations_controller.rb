class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def acount_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def after_sign_up_path_for(_resource)
    '/'
  end

  def after_sign_in_path_for(_resource)
    '/'
  end
end
