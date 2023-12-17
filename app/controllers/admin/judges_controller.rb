class Admin::JudgesController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @judges = Judge.all
  end

  def destroy
    Judge.find(params[:id]).destroy
    redirect_to admin_judges_path
  end
  
  
  private

  def judge_params
     params.require(:judge).permit(:point, :impression, :history_id, :comedian_id, :id)
  end

end
