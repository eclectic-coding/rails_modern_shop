class AddProductAvailableToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_available, :boolean, default: true
  end
end
