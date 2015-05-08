class Run < ActiveRecord::Base
  belongs_to :plan
  has_many :set_results
end
