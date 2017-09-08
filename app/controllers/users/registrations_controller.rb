class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def destroy
    if params[:user_id].present?
    @user = User.find(params[:user_id])
    @user.destroy
    else
      @user.destroy
    end
  end

  def edit
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    else
      @user
    end
  end

  def update
    if params[:user].present?
       @user = User.find_by_email(params[:user][:email])
      if @user.update_without_password(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation], is_active: params[:user][:is_active])
        redirect_to admin_index_url
      else
        render Rails.application.routes.recognize_path(request.referer)[:action]
      end
    else
      if @user.update_without_password(user_params)
        redirect_to admin_index_url
      else
        render Rails.application.routes.recognize_path(request.referer)[:action]
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :is_active, :password_confirmation)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :is_active])
  end
end