class Admin::FinalistsController < ApplicationController
  before_action :authenticate_admin!
  
  # def index
  #   @history = History.find_by_year(params[:year])
  #   @comedians = Comedian.where(history_id: @history.id)
  # end

  def new
    @history = History.new
    @history.comedians.build
  end

  def create
    @history = History.new(fainalist_params)
    if @history.save
      redirect_to admin_finalist_path(@history.id)
    else
      render :new
    end
  end

  def show
    @history = History.find(params[:id])
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    @history = History.find(params[:id])
    if @history.update(fainalist_params)
      redirect_to admin_finalist_path(@history.id)
    else
      render :edit
    end
  end
  
  private
  
  def fainalist_params
    params.require(:history).permit(:year, comedians_attributes: [:id, :name])
  end
  
end
