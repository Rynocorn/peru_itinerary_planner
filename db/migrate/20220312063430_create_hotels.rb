class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
