class Public::UsersController < ApplicationController
 before_action:authenticate_user!, only: [:edit]
 before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @judges = @user.judges
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to mypage_user_path(@user)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :id)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to mypage_user_path(@user)
    end
  end
end