require_relative '../../api/api'
class APIShell

  @api = Api.new('localhost:3000', 'flamine@list.ru', '6gVmTd6Xk79z-4TwibSu')

  def self.add_plan_to_product(product_name, plan_name)
    product_data = @api.get_products_by_param({name: product_name})
    product_id = JSON.parse(product_data).keys.first
    plan_data = @api.add_new_plan({:plan => {:name => plan_name,
                                 :version => '0'},
                       :product_id => product_id})
    run_data = @api.add_new_run({:run => {:name => JSON.parse(plan_data)['name'],
                                          :version => '0.0.0.0'},
                                 :plan_id => JSON.parse(plan_data)['id']})
    {run_data:JSON.parse(run_data)['id']}
  end

  def self.add_result(run_data, result_set_name, status)
    status = get_status_to_example(status.exception)
    status_id = @api.get_statuses_by_param({name:status})
    status_id = JSON.parse(status_id).keys.first
    result_set_data = @api.add_new_result_set({:result_set => {:name => result_set_name,
                                                :version => '0.0.0',
                                                :date => Time.now},
                                :status_id => status_id,
                                :run_id => run_data[:run_data].to_s})
    @api.add_new_result({:result => {:message => status.to_s,
                                     :author => 'API'},
                         :result_set_id => JSON.parse(result_set_data)['id'].to_s,
                         :status_id => status_id})
  end

  def self.get_status_to_example(status)
    case
      when status.nil?
        'Passed'
        else
        'Failed'
    end
  end
end