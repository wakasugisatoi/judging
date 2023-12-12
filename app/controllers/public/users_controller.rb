class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @imade = @user.image
    @judges = @user.judges 
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to mypage_user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :id)
  end
end
