class ChangeColumnToBlockedSchedule < ActiveRecord::Migration[5.2]
  def change
    change_column_null :blocked_schedules, :schedule_id, false
    change_column_null :blocked_schedules, :shop_id, false
  end
end
