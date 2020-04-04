class ChangeDeatilsInGalleries < ActiveRecord::Migration[5.2]
  def change
    remove_column :galleries, :category, :string
    rename_column :galleries, :user_id_creator, :user_id
  end
end
