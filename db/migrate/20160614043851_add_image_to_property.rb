class AddImageToProperty < ActiveRecord::Migration
  def change
    add_attachment :properties, :property_image
  end
end
