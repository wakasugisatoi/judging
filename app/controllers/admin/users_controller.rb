class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @judges = @user.judges
  end

  def is_active
    user = User.find(params[:id])
    user.update(is_active: !user.is_active) # 現在のステータスの反転
    redirect_to admin_user_path(user), notice: 'ユーザーのステータスが更新されました。'
  end
  
end
