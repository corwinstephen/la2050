class AddVideoUrlToGrantees < ActiveRecord::Migration
  def change
    add_column :grantees, :video_url, :string
  end
end
