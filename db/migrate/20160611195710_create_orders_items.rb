class CreateOrdersItems < ActiveRecord::Migration
  def change
    create_table :orders_items do |t|

      t.timestamps null: false
    end
  end
end
