class Public::JudgesController < ApplicationController
  def get_comedians_by_year
    year = params[:year]
    comedians = Comedian.joins(:histories).where(histories: { year: year }).distinct

    render json: comedians.select(:id, :name)
  end
  
  def index
  end
  
  def new
    @judge = Judge.new
    @histories = History.all
    @comedians = []
  end
  
  def search_comedians
    @history = History.find(params[:history_id])
    @comedians = @history.comedians
  end

  def create
    @judge = Judge.new(judge_params)
    @judge.save
    redirect_to comedian_judge_path(@judge.comedian_id)
  end
  
  def show
    @judge = Judge.find(params[:id])
  end

  def edit
    @judge = Judge.find(params[:id])
  end

  def update
    @judge = Judge.find(params[:id])
    if @judge.update
      redirect_to judge_path(@judge.id)
    else
      render :edit
    end
  end

  def destroy
    judge = Judge.find(params[:id])
    judge.destory
    redirect_to request.referer
  end
  
  private
  def judge_params
    params.require(:judge).permit(:point, :impression, :history_id, :comedian_id, :id)
  end
end
