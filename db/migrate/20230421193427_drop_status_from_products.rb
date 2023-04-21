class DropStatusFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :status, :integer
  end
end
