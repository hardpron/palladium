class SetResult < ActiveRecord::Base
  belongs_to :run
  has_many :results
end
