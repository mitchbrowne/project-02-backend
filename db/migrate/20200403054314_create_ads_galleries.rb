class CreateAdsGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :ads_galleries, :id => false do |t|
      t.integer :ad_id
      t.integer :gallery_id
    end
  end
end
