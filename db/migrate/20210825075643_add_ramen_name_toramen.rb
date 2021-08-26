class AddRamenNameToramen < ActiveRecord::Migration[6.0]
  def change
    add_column :ramen, :ramen_name, :string
  end
end
