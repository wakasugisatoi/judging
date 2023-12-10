class Public::ComediansController < ApplicationController
  def index
   @comedian = Comedian.find_by_name(params[:name])
  end
end
