class CreateOrdersProperties < ActiveRecord::Migration
  def change
    create_table :orders_properties do |t|
      t.references :property, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.string :quantity

      t.timestamps null: false
    end
  end
end
