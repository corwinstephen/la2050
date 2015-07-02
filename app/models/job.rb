class Job < ActiveRecord::Base
  validates_presence_of :title,
                        :organization,
                        :employment_type
end