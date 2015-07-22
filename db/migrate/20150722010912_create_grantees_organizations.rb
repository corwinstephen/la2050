class CreateGranteesOrganizations < ActiveRecord::Migration
  def change
    create_table :grantees_organizations do |t|
      t.references :grantee, null: false
      t.references :organization, null: false

      t.timestamps
    end
  end
end
