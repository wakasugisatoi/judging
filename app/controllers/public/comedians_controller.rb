class Public::ComediansController < ApplicationController
  def index
    @history = History.find_by_year(params[:year])
    @comedians = Comedian.where(history_id: @history.id)
  end
end
