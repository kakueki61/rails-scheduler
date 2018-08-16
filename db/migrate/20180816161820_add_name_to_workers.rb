class AddNameToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :name, :string, null: false, after: :email
  end
end
