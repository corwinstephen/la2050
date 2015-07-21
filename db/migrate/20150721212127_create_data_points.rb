class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.float :value, null: false
      t.references :metric, null: false
      t.timestamp :data_time, null: false

      t.timestamps
    end

    add_index :data_points, :metric_id
  end
end
