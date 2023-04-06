class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.timestamps
      t.string :caption
      t.references :camper, foreign_key: true, null: false
    end
  end
end
