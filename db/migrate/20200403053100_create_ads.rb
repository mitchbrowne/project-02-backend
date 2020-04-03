class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :image
      t.string :ad_type
      t.integer :user_id_has_seen
      t.integer :user_id_hasnot_seen
      t.integer :company_id

      t.timestamps
    end
  end
end
