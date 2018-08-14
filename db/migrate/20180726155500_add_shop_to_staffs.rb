class AddShopToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :shop, after: :email, foreign_key: true
  end
end
