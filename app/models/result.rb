class Result < ActiveRecord::Base
  belongs_to :result_set
  belongs_to :status
  after_commit :count_result_set_status

  def count_result_set_status
    unless self.status.nil? || self.result_set_id.nil?
      ResultSet.find(self.result_set_id).status
    end
  end
end
