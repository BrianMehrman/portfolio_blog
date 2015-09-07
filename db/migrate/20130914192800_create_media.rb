class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :description
      t.string :file
      t.string :media_type

      t.timestamps
    end
  end
end
