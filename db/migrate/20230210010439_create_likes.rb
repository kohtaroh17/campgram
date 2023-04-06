class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|

      t.timestamps
      t.integer :amount
      t.references :post, foreign_key: true, null: false
      t.references :camper, foreign_key: true, null: false
    end
  end
end
