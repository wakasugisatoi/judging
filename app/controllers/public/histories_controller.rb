class Public::HistoriesController < ApplicationController
  def index
    @histories = History.all
  end
end
