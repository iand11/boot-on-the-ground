class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :post_id
      t.integer :user_id
      t.integer :likes_id
      t.timestamps
    end
  end
end
