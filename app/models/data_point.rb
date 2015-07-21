class DataPoint < ActiveRecord::Base
  validates_presence_of :value,
                        :metric

  belongs_to :metric
end