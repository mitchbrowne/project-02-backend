class CreateAdsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :ads_users, :id => false do |t|
      t.integer :ad_id
      t.integer :user_id_has_seen
      t.integer :user_id_hasnot_seen
    end
  end
end
