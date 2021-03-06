# 管理画面
class Mng::WorkersController < Mng::BaseController
  before_action :authenticate_staff!

  def index
    if params[:date]
      @day = Time.zone.parse(params[:date])
    end
    @day ||= Time.zone.today
    @shop = my_shop
    @workers = WorkerDecorator.decorate_collection(my_workers)
  end

  def show
  end

  def arrange
    @worker = my_workers.find_by(id: params[:worker_id])
    @schedule = @worker.schedules.find_by(id: params[:schedule_id])
    @availables = @worker.schedules.find_by(id: params[:schedule_id]).available_time_ranges
  end

  def determine
    @worker = my_workers.find_by(id: params[:worker_id])
    @schedule = Schedule.find(schedule_id_param)
    shop = my_shop
    date = @schedule.start_at.to_date
    blocking = blocking_time_range(date)

    @fixed_schedule = FixedSchedule.new(schedule: @schedule, shop: shop, start_at: blocking.start_at, end_at: blocking.end_at)
    if @fixed_schedule.save
      render :complete
    else
      render :blocking_error
    end
  end

  private

  def my_shop
    current_staff.shop
  end

  def my_workers
    my_shop.workers
  end

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
