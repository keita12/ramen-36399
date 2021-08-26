class AddReferencesToRamen < ActiveRecord::Migration[6.0]
  def change
    add_reference :ramen, :user, null: false, foreign_key: true
  end
end
