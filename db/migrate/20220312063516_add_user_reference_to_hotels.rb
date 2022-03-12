class AddUserReferenceToHotels < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hotels, :users
    add_index :hotels, :user_id
    change_column_null :hotels, :user_id, false
  end
end
