class AddActivityReferenceToPictures < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pictures, :activities
    add_index :pictures, :activity_id
    change_column_null :pictures, :activity_id, false
  end
end
