class WorkersController < ApplicationController
  before_action :authenticate_staff!

  def index
    if params[:date]
      @day = Time.zone.parse(params[:date])
    end
    @day ||= Time.zone.today
    @workers = current_staff.shop.workers
  end

  def show
  end

  def arrange
  end

  def determine
  end
end
