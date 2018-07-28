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
  belongs_to :worker
  validates :worker_id, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  scope :of, ->(day) { where(start_at: day.beginning_of_day..day.end_of_day)
                           .where(end_at: day.beginning_of_day..day.end_of_day) }

  def to_string
    start_at.strftime("%H:%M") + " 〜 " + end_at.strftime("%H:%M")
  end
end
