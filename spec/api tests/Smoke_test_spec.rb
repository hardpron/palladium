require_relative '../../api/api'
require 'json'
describe 'Unit tests' do
  before :all do
    @api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')

    # Product Data
    @product_name = "Product_name#{Time.now.nsec}"
    @product_version = "Product_version#{Time.now.nsec}"
    @product_params = {:product => {:name => @product_name,
                                   :version => @product_version}}
    response_product = @api.add_new_product(@product_params)
    @product_id = JSON.parse(response_product)['id']

    # Plan Data
    @plan_name = "Plan_name#{Time.now.nsec}"
    @plan_version = "Plan_version#{Time.now.nsec}"
    @plan_params = {:plan => {:name => @plan_name,
                              :version => @plan_version},
                    :product_id => @product_id}

    response_plan = @api.add_new_plan(@plan_params)
    @plan_id = JSON.parse(response_plan)['id']

    # Run Data
    @run_name = "Run_name#{Time.now.nsec}"
    @run_version = "Run_name#{Time.now.nsec}"
    @run_params = {:run => {:name => @run_name,
                            :version => @run_version},
                   :plan_id => @plan_id}
    response_run = @api.add_new_run(@run_params)
    @run_id = JSON.parse(response_run)['id']
  end

  describe 'Products' do

    it 'add_new_product' do
      params = {:product => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
      response = @api.add_new_product(params)
      expect(JSON.parse(response)['name']).to eq params[:product][:name]
    end

    it 'add_new_product with status field' do
      params = {:product => {:name => "name#{Time.now.nsec}", :status => "status#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
      response = @api.add_new_product(params)
      expect(JSON.parse(response)['name']).to eq params[:product][:name]
      expect(JSON.parse(response)['status']).to be_nil
    end

    it 'get_all_products' do
      response = JSON.parse @api.get_all_products
      expect(response).not_to be_empty
    end

    it 'get_products_by_param' do
      response = JSON.parse(@api.get_products_by_param({:name => @product_name}))
      expect(response.values.first['version']).to eq(@product_version)
    end

    it 'get_all_plans_by_product' do
      params = {:id => @product_id}
      response = JSON.parse @api.get_all_plans_by_product(params)
      expect(response.keys.first).to eq(@plan_id.to_s)
    end

    it 'edit_product' do
      response = @api.add_new_product(@product_params)
      id = JSON.parse(response)['id']
      params = {:product => {:name => "name_after_edit#{Time.now.nsec}",
                             :status => response['status'],
                             :version => response['version']},
                             :id => id}
      response = @api.edit_product(params)
      response = JSON.parse(response)
      expect(response['name']).to eq(params[:product][:name])
    end

    it 'delete_product' do
      response = JSON.parse(@api.get_all_products)
      current_product_data = response[response.keys.first]
      params = {:id => response.keys.first}
      @api.delete_product(params)
      response = JSON.parse(@api.get_products_by_param({:name => current_product_data['ProductName']}))
      expect(response).to be_empty
    end
  end

  describe 'Plans' do

    it 'add_new_plan' do
      params = {:plan => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}, :product_id => @product_id}
      response = @api.add_new_plan(params)
      response = JSON.parse(response)
      expect(response['name']).to eq params[:plan][:name]
    end

    it 'get_all_plans' do
      response = JSON.parse @api.get_all_plans
      expect(response).not_to be_empty
    end

    it 'get_plans_by_param' do
      response = JSON.parse(@api.get_plans_by_param({:name => @plan_name}))
      expect(response.values.first['version']).to eq(@plan_version)
    end

    it 'edit_plan' do
      response = JSON.parse @api.get_plans_by_param({:name => @plan_name})
      current_plan_data = response[response.keys.first]
      params = {:plan => {:name => "name_after_edit#{Time.now.nsec}",
                          :version => current_plan_data['ProductVersion']}}
      params.merge!({:id => response.keys.first})
      response = @api.edit_plan(params)
      response = JSON.parse(response)
      expect(response['name']).to eq(params[:plan][:name])
    end

    it 'delete_plan' do
      response = JSON.parse(@api.get_all_plans)
      current_plan_data = response[response.keys.first]
      params = {id: response.keys.first}
      @api.delete_plan(params)
      response = JSON.parse(@api.get_plans_by_param({:name => current_plan_data['PlanName']}))
      expect(response).to be_empty
    end
  end

  describe 'Runs' do
    it 'get_all_runs' do
        response = JSON.parse @api.get_all_runs
        expect(response).not_to be_empty
    end

    it 'get_runs_by_param' do
      response = JSON.parse(@api.get_runs_by_param({:name => @run_name}))
      expect(response.values.first['RunVersion']).to eq(@run_version)
    end

    it 'add_new_run' do
      params = {:run => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}, :plan_id => @plan_id}
      response = @api.add_new_run(params)
      expect(JSON.parse(response)['name']).to eq params[:run][:name]
    end
  end
end
