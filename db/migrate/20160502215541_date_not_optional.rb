class DateNotOptional < ActiveRecord::Migration
  def change
    change_column :jobs, :date_posted, :datetime, null: false
  end
end
