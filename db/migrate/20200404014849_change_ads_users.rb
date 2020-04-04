class ChangeAdsUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads_users, :user_id_has_seen, :integer
    remove_column :ads_users, :user_id_hasnot_seen, :integer
    add_column :ads_users, :user_id, :integer
    add_column :ads_users, :has_been_seen, :boolean
  end
end
