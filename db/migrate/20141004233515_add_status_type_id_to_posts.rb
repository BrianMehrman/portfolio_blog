class AddStatusTypeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status_type_id, :integer, :default=> 1
  end
end
