class CreateActionItems < ActiveRecord::Migration
  def change
    create_table :action_items do |t|
      t.string :title, null: false
      t.text :description
      t.string :action_url, null: false
      t.string :action_text, null: false

      t.timestamps null: false
    end
  end
end
