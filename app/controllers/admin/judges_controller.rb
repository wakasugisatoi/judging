class Admin::JudgesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @judges = Judge.all.order(created_at: :desc)
  end

  def destroy
    judge = Judge.find(params[:id])
    judge.destroy
    redirect_to  admin_user_path(judge.user)
  end
  
  
  private

  def judge_params
     params.require(:judge).permit(:point, :impression, :history_id, :comedian_id, :id)
  end

end
