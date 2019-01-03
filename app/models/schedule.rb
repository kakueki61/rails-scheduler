# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  end_at     :datetime
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  worker_id  :bigint(8)
#
# Indexes
#
#  index_schedules_on_worker_id  (worker_id)
#
# Foreign Keys
#
#  fk_rails_...  (worker_id => workers.id)
#

class Schedule < ApplicationRecord
  has_many :fixed_schedules
  belongs_to :worker
  validates :worker_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  scope :of, ->(day) { where(start_at: day.beginning_of_day..day.end_of_day)
                           .where(end_at: day.beginning_of_day..day.end_of_day) }

  def to_string
    start_at.strftime("%H:%M") + " 〜 " + end_at.strftime("%H:%M")
  end

  def available_time_ranges
    schedules = []

    if fixed_schedules.empty?
      schedules << TimeRange.new(start_at, end_at)
      return schedules
    end

    sorted_fixed_schedules = fixed_schedules.sort {|a, b| a.start_at <=> b.start_at}

    interval = Constants::SCHEDULE_INTERVAL_TIME
    sorted_fixed_schedules.inject(nil) do |prev, current|
      if prev.nil?
        if (current.start_at - start_at) >= interval
          schedules << TimeRange.new(start_at, current.start_at - interval)
        end
      else
        if (current.start_at - prev.end_at) > interval * 2
          schedules << TimeRange.new(prev.end_at + interval, current.start_at - interval)
        end
      end
      current
    end

    if (end_at - sorted_fixed_schedules.last.end_at) >= interval
      schedules << TimeRange.new(sorted_fixed_schedules.last.end_at + interval, end_at)
    end
    schedules
  end

  def available_time_range_text
    available_time_ranges.map do |range|
      range.to_string
    end.join(", ")
  end

  def fixed_schedules_by_shop(shop)
    fixed_schedules.where(shop: shop)
  end
end
