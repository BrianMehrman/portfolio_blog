class CreateHtmlSnippets < ActiveRecord::Migration
  def change
    create_table :html_snippets do |t|
      t.string :name
      t.string :description
      t.text :html
      t.text :css
      t.text :javascript
      t.attachment :image

      t.timestamps
    end
  end
end
