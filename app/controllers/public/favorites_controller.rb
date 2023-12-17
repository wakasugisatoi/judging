class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  
  def create
    @judge = Judge.find(params[:judge_id])
    favorite = current_user.favorites.new(judge_id: @judge.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @judge = Judge.find(params[:judge_id])
    favorite = current_user.favorites.find_by(judge_id: @judge.id)
    favorite.destroy
    # redirect_to request.referer
  end
end
