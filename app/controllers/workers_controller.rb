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
    @availables = @worker.schedules.find_by(id: params[:schedule_id]).available_time_ranges
  end

  def determine
    @worker = current_staff.shop.workers.find_by(id: params[:worker_id])
    @schedule = Schedule.find(schedule_id_param)
    shop = current_staff.shop
    date = @schedule.start_at.to_date
    blocking = blocking_time_range(date)

    @blocked_schedule = BlockedSchedule.new(schedule: @schedule, shop: shop, start_at: blocking.start_at, end_at: blocking.end_at)
    if @blocked_schedule.save
      binding.pry
      render :complete
    else
      binding.pry
      render :blocking_error
    end
  end

  private

  def schedule_params
    params.require(:schedule)
  end

  def schedule_id_param
    params.require(:schedule_id)
  end

  def blocking_time_range(date)
    blocking = schedule_params
    TimeRange.new(
        date + blocking[:start_hour].to_i.hour + blocking[:start_min].to_i.minute,
        date + blocking[:end_hour].to_i.hour + blocking[:end_min].to_i.minute
    )
  end
end
