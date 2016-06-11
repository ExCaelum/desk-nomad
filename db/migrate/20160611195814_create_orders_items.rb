class CreateOrdersItems < ActiveRecord::Migration
  def change
    create_table :orders_items do |t|
      t.references :user, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer "quantity"

      t.timestamps null: false
    end
  end
end
