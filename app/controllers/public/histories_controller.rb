class Public::HistoriesController < ApplicationController
  def index
    @histories = History.all
  end
  
  def index_comedians
    @history = History.find(params[:id])
    @comedians = Comedian.where(history_id: @history)
  end
  
end
