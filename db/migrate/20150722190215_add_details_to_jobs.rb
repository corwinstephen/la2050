class AddDetailsToJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :organization, :string
    add_column :jobs, :location, :string
    add_column :jobs, :description, :text
    add_column :jobs, :to_apply, :text
    add_column :jobs, :date_posted, :datetime
  end
end
