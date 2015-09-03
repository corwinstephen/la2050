class Grantee < ActiveRecord::Base
  validates_presence_of :project_name, :year

  has_many  :goal_taggings,
            as: :taggable

  has_many  :goals,
            through: :goal_taggings

  has_and_belongs_to_many :organizations

  has_attached_file :photo, :styles => { :medium => "600x600>", :small => "360x215#", :thumb => "100x100>" }, :default_url => "grantees/missing.svg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


end