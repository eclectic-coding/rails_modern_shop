class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.text :description
      t.string :image
      t.string :stock
      t.integer :quantity
      t.references :category, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
