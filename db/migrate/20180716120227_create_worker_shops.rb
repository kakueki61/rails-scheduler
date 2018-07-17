class CreateWorkerShops < ActiveRecord::Migration[5.2]
  def change
    create_table :worker_shops do |t|
      t.references :worker, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
