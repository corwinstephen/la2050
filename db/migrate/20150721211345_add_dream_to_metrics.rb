class AddDreamToMetrics < ActiveRecord::Migration
  def change
    add_column :metrics, :dream, :boolean, null: false, default: false
  end
end
