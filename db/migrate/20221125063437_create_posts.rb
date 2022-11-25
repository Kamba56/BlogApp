class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :article
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
