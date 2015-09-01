class Report < ActiveRecord::Base
  validates_presence_of :title

  has_attached_file :photo,
                    :styles => { :medium => "600x600>", :small => "360x215#", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => '/reports/:id/:style/:filename',
                    :default_url => "/images/:style/missing.png",
                    :url => ":s3_domain_url",
                    :s3_host_name => "s3-us-west-1.amazonaws.com"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end