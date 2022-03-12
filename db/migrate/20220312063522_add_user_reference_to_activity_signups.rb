class AddUserReferenceToActivitySignups < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_signups, :users
    add_index :activity_signups, :user_id
    change_column_null :activity_signups, :user_id, false
  end
end
