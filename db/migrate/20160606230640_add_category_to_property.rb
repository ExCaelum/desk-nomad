class AddCategoryToProperty < ActiveRecord::Migration
  def change
    add_reference :properties, :category, index: true, foreign_key: true
  end
end
