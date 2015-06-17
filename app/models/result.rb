class Result < ActiveRecord::Base
  belongs_to :result_set
  belongs_to :status
  after_commit :count_result_set_status

  # private
#   def count_result_set_status
#     unless self.result_set_id.nil?
#       unless self.status.nil?
#
#
#
#         result_set = ResultSet.find(self.result_set_id)
#         if result_set_status_is_nil?
#           result_set.update(status: [results_with_main_status])
#         else
#           # result_set.status.convert_to_array.size == result_set.results.count
#           p 'добавить еще данных'
#           p  result_set.results
#           p result_set.status.convert_to_array
#           # result_set.status << results_with_all_statuses
#         end
#
#
#
#
#       end
#     end
#   end
#
#   def result_set_status_is_nil?
#     ResultSet.find(self.result_set_id).status.nil?
#   end
#
#   def results_with_main_status
#     count = ResultSet.find(self.result_set_id).results.where(status_id: Status.find_by_main_status(true).id).map{|current_element| current_element.id}.to_s
#     {name: Status.find_by_main_status(true).name, count: count, color: Status.find_by_main_status(true).color}
#   end
#
#   def results_with_all_statuses
#     ['loloo']
#   end
end
