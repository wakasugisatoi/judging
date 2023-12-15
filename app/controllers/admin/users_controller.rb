class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def status
    @user = User.find(params[:id])
    @user.update(status: params[:status])
    redirect_to admin_user_path(@user), notice: 'ユーザーが利用停止に更新されました。'
  end
  
end
