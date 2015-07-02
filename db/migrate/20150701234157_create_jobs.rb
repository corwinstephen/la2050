class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :organization, null: false
      t.string :employment_type, null: false

      t.timestamps
    end
  end
end
