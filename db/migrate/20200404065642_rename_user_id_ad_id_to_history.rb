class RenameUserIdAdIdToHistory < ActiveRecord::Migration[5.2]
  def change
    rename_table :ads_users, :histories
  end
end
