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
    @worker = current_staff.shop.workers.find_by(id: params[:worker_id])
    @schedule = @worker.schedules.find_by(id: params[:schedule_id])
  end

  def determine
  end
end
