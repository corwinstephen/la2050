class AddDetailsToGrantees < ActiveRecord::Migration
    def change
    create_table organizations do |t|
      t.string :name, null: false
      t.string :url
    end
  end

  def change
    add_column :grantees, :organization_id, :integer
    add_column :grantees, :website_url, :string
    add_column :grantees, :submission_url, :string
    add_column :grantees, :instagram, :string
    add_column :grantees, :twitter, :string
    add_column :grantees, :facebook, :string
  end
end