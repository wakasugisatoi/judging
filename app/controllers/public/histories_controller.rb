class Public::HistoriesController < ApplicationController
  def index
    @histories = History.all
  end
  
  def index_comedians
    # params[:year] が存在するか確認し、存在しない場合は最新の年を使う
    @history = History.find_by_year(params[:year]) || History.last
    @comedians = Comedian.where(history_id: @history)
  end
  
end
