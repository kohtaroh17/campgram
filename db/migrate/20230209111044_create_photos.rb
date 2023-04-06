class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|

      t.timestamps
      t.string :image, null: false
      t.references :post, foreign_key: true, null: false
    end
  end
end
