class AddDescriptionToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :description, :text
    add_column :metrics, :target_description, :text
  end
end
