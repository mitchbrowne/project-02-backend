class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :category
      t.integer :user_id_creator

      t.timestamps
    end
  end
end
