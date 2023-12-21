class Public::JudgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def get_comedians_by_year
    year = params[:year]
    comedians = Comedian.joins(:histories).where(histories: { year: year }).distinct

    render json: comedians.select(:id, :name)
  end
  
  def index
    @user_ids = User.where(is_active: true).pluck(:id)
    @judges = Judge.where(user_id: @user_ids).order(created_at: :desc)
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
    @judge.user_id = current_user.id
    if@judge.save
      flash[:notice] = "審査を投稿しました。"
      redirect_to comedian_judge_path(@judge.comedian_id)
    else
      @histories = History.all
      @comedians = []
      # flash[:notice] = "投稿に失敗しました。"
      render :new
    end
  end
  
  def show
    @judge = Judge.find(params[:id])
    @judge_comment = JudgeComment.new
  end

  def edit
    @judge = Judge.find(params[:id])
    @histories = History.all
    @comedians = @judge.history.comedians
  end

  def update
    @judge = Judge.find(params[:id])
    if @judge.update(judge_params)
      flash[:notice] = "変更を保存しました。"
      redirect_to judge_path(@judge.id)
    else
      @histories = History.all
      @comedians = @judge.history.comedians
      render :edit
    end
  end

  def destroy
    judge = Judge.find(params[:id])
    if judge.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to mypage_user_path(judge.user.id)
    else 
      flash[:alert] = "削除に失敗しました。"
      render :show
    end
  end
  
  private
  def judge_params
    params.require(:judge).permit(:point, :impression, :history_id, :comedian_id, :id)
  end
end
