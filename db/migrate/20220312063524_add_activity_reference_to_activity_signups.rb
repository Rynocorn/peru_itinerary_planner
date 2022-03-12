class AddActivityReferenceToActivitySignups < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activity_signups, :activities
    add_index :activity_signups, :activity_id
    change_column_null :activity_signups, :activity_id, false
  end
end
