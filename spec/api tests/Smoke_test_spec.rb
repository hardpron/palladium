require_relative '../../api/api'
require 'json'
describe 'Unit tests' do
  before :each do
    @api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')

    # Product Data
    @product_name = "Product_name#{Time.now.nsec}"
    @product_version = "Product_version#{Time.now.nsec}"

    @api.add_new_product({:product => {:name => @product_name, :status => @product_status, :version => @product_version}})

    @product_id = JSON.parse(@api.get_products_by_param({:name => @product_name})).keys.first

    # Plan Data
    @plan_name = "Plan_name#{Time.now.nsec}"
    @plan_version = "Plan_version#{Time.now.nsec}"

    @api.add_new_plan({:plan => {:name => @plan_name, :version => @plan_version}, :product_id => @product_id})
    @plan_id = JSON.parse(@api.get_plans_by_param({:name => @plan_name})).keys.first
  end

  describe 'Products' do

    it 'add_new_product' do
      params = {:product => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
      @api.add_new_product(params)
      response = JSON.parse(@api.get_products_by_param({:name => params[:product][:name]}))
      expect(response.values.size).to eq 1
    end

    it 'add_new_product with status field' do
      params = {:product => {:name => "name#{Time.now.nsec}", :status => "status#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
      @api.add_new_product(params)
      response = JSON.parse(@api.get_products_by_param({:name => params[:product][:name]}))
      expect(response.values.first['productStatus']).to be_nil
    end

    it 'get_all_products' do
      response = JSON.parse @api.get_all_products
      expect(response).not_to be_empty
    end

    it 'get_products_by_param' do
      response = JSON.parse(@api.get_products_by_param({:name => @product_name}))
      expect(response.values.first['ProductVersion']).to eq(@product_version)
    end

    it 'get_all_plans_by_product' do
      params = {:id => @product_id}
      response = JSON.parse @api.get_all_plans_by_product(params)
      expect(response.keys.first).to eq(@plan_id)
    end

    it 'edit_product' do
      response = JSON.parse(@api.get_all_products)
      current_product_data = response[response.keys.first]
      params = {:product => {:name => "name_after_edit#{Time.now.nsec}",
                             :status => current_product_data['ProductStatus'],
                             :version => current_product_data['ProductVersion']}}
      params.merge!({:id => response.keys.first})
      @api.edit_product(params)
      response = JSON.parse(@api.get_products_by_param({:id => response.keys.first}))
      expect(response.values.first['ProductName']).to eq(params[:product][:name])
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
      params = {:plan => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}, :product_id => '164'}
      @api.add_new_plan(params)
      response = JSON.parse(@api.get_plans_by_param({:name => params[:plan][:name]}))
      expect(response.values.first['PlanName']).to eq params[:plan][:name]
    end

    it 'get_all_plans' do
      response = JSON.parse @api.get_all_plans
      expect(response).not_to be_empty
    end

    it 'get_plans_by_param' do
      response = JSON.parse(@api.get_plans_by_param({:name => @plan_name}))
      expect(response.values.first['PlanVersion']).to eq(@plan_version)
    end

    it 'edit_plan' do
      response = JSON.parse @api.get_plans_by_param({:name => @plan_name})
      current_plan_data = response[response.keys.first]
      params = {:plan => {:name => "name_after_edit#{Time.now.nsec}",
                          :version => current_plan_data['ProductVersion']}}
      params.merge!({:id => response.keys.first})
      @api.edit_plan(params)
      response = JSON.parse(@api.get_plan_by_param({:id => response.keys.first}))
      expect(response.values.first['PlanName']).to eq(params[:plan][:name])
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


  end
end
