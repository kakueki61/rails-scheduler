class CreateBlockedSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :blocked_schedules do |t|
      t.references :schedule, foreign_key: true
      t.references :shop, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
