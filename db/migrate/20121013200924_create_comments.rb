class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :guest_name
      t.text :content

      t.timestamps
    end
  end
end
