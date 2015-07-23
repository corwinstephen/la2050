class ActionItem < ActiveRecord::Base
  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings


  has_attached_file :photo,
                    :styles => { :medium => "600x600>", :small => "360x215#", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => '/action_items/:id/:style/:filename',
                    :default_url => "/images/:style/missing.png",
                    :url => ":s3_domain_url",
                    :s3_host_name => "s3-us-west-1.amazonaws.com"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :title,
                        :action_url,
                        :action_text
end
