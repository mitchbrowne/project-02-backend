class RemoveUserSeenFromAds < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads, :user_id_has_seen, :integer
    remove_column :ads, :user_id_hasnot_seen, :integer
  end
end
