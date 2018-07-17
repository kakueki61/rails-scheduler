class AddWorkerToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :worker, foreign_key: true
  end
end
