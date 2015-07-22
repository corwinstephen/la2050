class Organization < ActiveRecord::Base
  has_and_belongs_to_many :grantees
  has_and_belongs_to_many :jobs
end
