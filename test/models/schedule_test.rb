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

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
