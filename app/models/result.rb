class Result < ActiveRecord::Base
  belongs_to :result_set
  belongs_to :status
end
