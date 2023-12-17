# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private

  def user_state
    user = User.find_by(email: params[:user][:email])
    if user.present? 
      if user.valid_password?(params[:user][:password]) && !user.is_active
        flash[:alert] = "このアカウントは利用停止されました。"
        redirect_to new_user_session_path
      end 
    end
  end
      # 
      #   flash[:alert] = "このアカウントは利用停止されました。"
      #   redirect_to user_session_path and return
      # else
      #   super
      # end
      
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # inactive_users = User.where(is_active: false)

  # POST /resource/sign_in

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
