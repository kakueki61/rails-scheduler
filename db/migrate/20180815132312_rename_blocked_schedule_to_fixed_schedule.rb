class RenameBlockedScheduleToFixedSchedule < ActiveRecord::Migration[5.2]
  def change
    rename_table :blocked_schedules, :fixed_schedules
  end
end
