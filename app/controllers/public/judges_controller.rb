class Public::JudgesController < ApplicationController
  
  def index
  end
  
  def new
    @history = History.find_by_year(params[:year]) || History.last
    @comedian = Comedian.where(history_id: @history)
    @judge = Judge.new
    
  end

  def create
    @judge = Judge.new(judge_params)
    if @judge.save
      redirect_to comedian_path(@history.comedians.id)
    else
      render new
    end
  end 
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def judge_params
    params.require(:judge).permit(:point, :impression, :history_id, :comedian_id, :id)
  end
end
