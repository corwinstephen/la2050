class CreateGrantees < ActiveRecord::Migration
  def change
    create_table :grantees do |t|
      t.string :project_name, null: false
      t.integer :year, null: false
      t.text :description
      t.string :action_url
    end

    add_attachment :grantees, :photo
  end
end
