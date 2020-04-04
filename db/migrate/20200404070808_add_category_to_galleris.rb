class AddCategoryToGalleris < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :category, :string
  end
end
