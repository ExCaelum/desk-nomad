class AddContactsTable < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text   :message

      t.timestamp null: false
    end 
  end
end
