class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.string :user_type
      t.integer :ad_id
      t.integer :company_id
      t.integer :gallery_id

      t.timestamps
    end
  end
end
