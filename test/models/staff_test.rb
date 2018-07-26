# == Schema Information
#
# Table name: staffs
#
#  id                     :bigint(8)        not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  shop_id                :bigint(8)
#
# Indexes
#
#  index_staffs_on_email                 (email) UNIQUE
#  index_staffs_on_reset_password_token  (reset_password_token) UNIQUE
#  index_staffs_on_shop_id               (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#

require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
