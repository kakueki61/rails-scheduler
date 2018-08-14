# == Schema Information
#
# Table name: blocked_schedules
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
#  index_blocked_schedules_on_schedule_id  (schedule_id)
#  index_blocked_schedules_on_shop_id      (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (schedule_id => schedules.id)
#  fk_rails_...  (shop_id => shops.id)
#

require 'test_helper'

class BlockedScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
