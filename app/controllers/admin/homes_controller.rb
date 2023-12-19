class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
    def top
      @year = params[:year]
      @histories = History.all.order(created_at: :desc)
    end
    
    
end
