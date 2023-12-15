class Public::ComediansController < ApplicationController
  def judge
   comedian_id = params[:id]
   @comedian = Comedian.find(comedian_id)
   @judges = @comedian.judges.all
  end
end
