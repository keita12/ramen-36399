class CreateRamen < ActiveRecord::Migration[6.0]
  def change
    create_table :ramen do |t|
      t.string :store_name ,null: :false
      t.integer :star_id, null: :false
      t.text :text, null: :false
      t.timestamps
    end
  end
end
