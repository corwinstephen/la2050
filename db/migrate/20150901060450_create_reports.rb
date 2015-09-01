class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.text :description
      t.string :report_url

      t.timestamps null: false
    end
  end
end
