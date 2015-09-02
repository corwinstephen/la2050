class Report < ActiveRecord::Base
  validates_presence_of :title

  has_attached_file :photo,
                    :styles => { :medium => "300x400>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => '/reports/:id/photos/:style/:filename',
                    :default_url => "/images/:style/missing.png",
                    :url => ":s3_domain_url",
                    :s3_host_name => "s3-us-west-1.amazonaws.com"

  has_attached_file :pdf,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => '/reports/:id/pdfs/:filename',
                    :url => ":s3_domain_url",
                    :s3_host_name => "s3-us-west-1.amazonaws.com"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end