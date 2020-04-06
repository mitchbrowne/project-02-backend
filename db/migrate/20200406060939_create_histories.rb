class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :ad_id
      t.boolean :has_been_seen
    end
  end
end
