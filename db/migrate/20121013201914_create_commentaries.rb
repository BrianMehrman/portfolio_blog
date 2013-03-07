class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.integer :comment_id
      t.integer :post_id

      t.timestamps
    end
  end
end
