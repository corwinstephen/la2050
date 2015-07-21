class AddDataUnitToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :data_unit, :string
  end
end
