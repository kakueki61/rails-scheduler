# == Schema Information
#
# Table name: fixed_schedules
#
#  id          :bigint(8)        not null, primary key
#  end_at      :datetime
#  start_at    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  schedule_id :bigint(8)        not null
#  shop_id     :bigint(8)        not null
#
# Indexes
#
#  index_fixed_schedules_on_schedule_id  (schedule_id)
#  index_fixed_schedules_on_shop_id      (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#  fk_rails_...  (shop_id => shops.id)
#

class FixedSchedule < ApplicationRecord
  belongs_to :schedule
  belongs_to :shop

  validate :end_should_be_later_than_start
  validate :duplication_for_the_same_schedule

  def to_string
    start_at.strftime("%H:%M") + " 〜 " + end_at.strftime("%H:%M")
  end

  private

  def end_should_be_later_than_start
    if start_at >= end_at
      errors.add(:base, "終了時間が開始時間より早くなっています。")
    end
  end

  def duplication_for_the_same_schedule
    fixed_schedules = FixedSchedule.where(schedule_id: schedule_id)
    fixed_schedules.each do |fixed|
      if start_at < fixed.start_at && fixed.start_at < end_at + Constants::SCHEDULE_INTERVAL_TIME
        add_duplication_error
        break
      elsif fixed.start_at <= start_at && start_at < fixed.end_at + Constants::SCHEDULE_INTERVAL_TIME
        add_duplication_error
        break
      end
    end
  end

  def add_duplication_error
    errors.add(:base, "他のスケジュールと重複しています。")
  end
end
