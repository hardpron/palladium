class Result < ActiveRecord::Base
  belongs_to :result_set
  belongs_to :status
  after_commit :count_result_set_status

  private
  def count_result_set_status
    unless self.result_set_id.nil?
      unless self.status.nil?
        result_set = ResultSet.find(self.result_set_id)
        if result_set_status_is_nil?
          result_set.update(status: [results_with_main_status])
        else
          unless result_set.results.count == number_of_results_in_status(result_set)
            update_status(result_set)
          end
        end
      end
    end
  end

  def result_set_status_is_nil?
    ResultSet.find(self.result_set_id).status.nil?
  end

  def results_with_main_status
    count = ResultSet.find(self.result_set_id).results.where(status_id: Status.find_by_main_status(true).id).map{|current_element| current_element.id}
    {name: Status.find_by_main_status(true).name, count: count.to_s, data: [count.count], color: Status.find_by_main_status(true).color}
  end

  def number_of_results_in_status(result_set)
    numbere_of_results = 0
    result_set.status.each do |current_status|
      numbere_of_results += current_status[:count].convert_to_array.size
    end
    numbere_of_results
  end

  def update_status(result_set)
    result_set.update(status: [{name: Status.find_by_main_status(true).name, count:[], data: [0], color: Status.find_by_main_status(true).color}]) if result_set.status.nil?
    result_set_status = result_set.status
    array_of_statuses = result_set_status.map{|current_status_hash| current_status_hash[:name]}
    if array_of_statuses.include?(Status.find(self.status_id).name)
    result_set_status.map! do |current_status_hash|
      if current_status_hash[:name] == Status.find(self.status_id).name
        unless current_status_hash[:count].convert_to_array.include?(self.id)
          new_count = current_status_hash[:count].convert_to_array << self.id
          current_status_hash[:data] = [new_count.size]
          current_status_hash[:count] = new_count.to_s
          current_status_hash
        end
      end
    end
    else
      result_set_status << {name: Status.find(self.status_id).name, count: [self.id], data:[1], color: Status.find_by_main_status(true).color}
    end
    result_set.update(status: result_set_status)
  end
end
