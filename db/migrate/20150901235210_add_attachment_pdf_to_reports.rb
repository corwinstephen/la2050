class AddAttachmentPdfToReports < ActiveRecord::Migration
  def self.up
    change_table :reports do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :reports, :pdf
  end
end
