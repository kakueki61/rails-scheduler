class SchedulesController < ApplicationController
  before_action :authenticate_worker!

  def index
    @signedIn = worker_signed_in?
    @worker = current_worker
  end

  def new
    @worker = current_worker
    @now = Time.zone.now

    @hour_options = hour_options
    @min_options = min_options

    @schedules = []
    14.times do |i|
      day = @now + i.day
      schedule = @worker.schedules.select {|it| it.start_at&.to_date == day.to_date }.first

      if schedule.present?
        @schedules << schedule
      else
        @schedules << @worker.schedules.build
      end
    end
  end

  def create
    @saved_schedules = []
    schedules_params.each do |schedule|
      next if schedule.values.any?(&:blank?)

      date = Date.parse(schedule[:date])
      start_at = date + schedule[:start_hour].to_i.hour + schedule[:start_min].to_i.minute
      end_at = date + schedule[:end_hour].to_i.hour + schedule[:end_min].to_i.minute

      draft = current_worker.schedules.build(start_at: start_at, end_at: end_at)
      if draft.save
        @saved_schedules << draft
      end
    end
    render :complete
  end

  private

  def hour_options
    options = {}
    24.times do |i|
      options["%02d" % i] = i
    end
    options
  end

  def min_options
    [["00", 0], ["15", 15], ["30", 30], ["45", 45]]
  end

  def schedules_params
    params.require(:schedules)
  end

end
