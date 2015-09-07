class CreateStatusTypes < ActiveRecord::Migration
  def change
    create_table :status_types do |t|
      t.string :name
      t.boolean :public_use, default: false

      t.timestamps
    end
  end
end
