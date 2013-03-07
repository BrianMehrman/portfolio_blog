class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :user_id

      t.text :content

      t.text :html
      t.text :css 
      t.text :javascript

      t.timestamps
    end
  end
end
