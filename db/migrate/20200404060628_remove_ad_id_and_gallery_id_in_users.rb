class RemoveAdIdAndGalleryIdInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :ad_id, :integer
    remove_column :users, :gallery_id, :integer
  end
end
