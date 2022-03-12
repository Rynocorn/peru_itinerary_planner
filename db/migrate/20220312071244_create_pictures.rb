class CreatePictures < ActiveRecord::Migration[6.0]
  def change
    create_table :pictures do |t|
      t.integer :activity_id
      t.string :picture
      t.string :name

      t.timestamps
    end
  end
end
