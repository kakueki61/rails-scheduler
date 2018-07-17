# == Schema Information
#
# Table name: worker_shops
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint(8)
#  worker_id  :bigint(8)
#
# Indexes
#
#  index_worker_shops_on_shop_id    (shop_id)
#  index_worker_shops_on_worker_id  (worker_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (worker_id => workers.id)
#

class WorkerShop < ApplicationRecord
  belongs_to :worker
  belongs_to :shop
end
