class RemoveImageColumnsFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :image_file_name
    remove_column :properties, :image_file_size
    remove_column :properties, :image_content_type
    remove_column :properties, :image_updated_at
  end
end
