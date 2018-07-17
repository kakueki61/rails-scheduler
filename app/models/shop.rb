# == Schema Information
#
# Table name: shops
#
#  id         :bigint(8)        not null, primary key
#  name       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shop < ApplicationRecord
  has_many :worker_shops
  has_many :workers, through: :worker_shops
end
