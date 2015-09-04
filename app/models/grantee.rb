class Grantee < ActiveRecord::Base
  validates_presence_of :project_name, :year

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings

  has_and_belongs_to_many :organizations

  has_attached_file :photo, 
                    :styles => { :medium => "600x600>", :small => "360x215#", :thumb => "100x100>" },
                    :path => '/grantees/:id/photos/:style/:filename',
                    :default_url => "grantees/missing.svg",
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :url => ":s3_domain_url",
                    :s3_host_name => "s3-us-west-1.amazonaws.com"

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_photo
  before_validation { self.photo.clear if self.delete_photo == '1' }

  def learn_more_url
    action_url || website_url || submission_url
  end
end