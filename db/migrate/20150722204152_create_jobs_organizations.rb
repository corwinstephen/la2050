class CreateJobsOrganizations < ActiveRecord::Migration
  def change
    create_table :jobs_organizations do |t|
      t.references :job, null: false
      t.references :organization, null: false

      t.timestamps
    end
  end
end