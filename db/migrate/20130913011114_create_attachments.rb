class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.integer :post_id
      t.integer :attacher_id
      t.string :slug_name

      t.timestamps
    end
  end
end
