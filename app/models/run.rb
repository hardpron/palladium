class Run < ActiveRecord::Base
  belongs_to :plan
  has_many :result_sets, dependent: :destroy
end
