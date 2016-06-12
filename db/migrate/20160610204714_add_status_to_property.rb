class AddStatusToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :status, :string, default: "active"
  end
end
