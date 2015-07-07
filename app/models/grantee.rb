class Grantee < ActiveRecord::Base
  has_attached_file :photo, :styles => { :medium => "600x600>", :small => "360x215#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_presence_of :project_name, :year
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end