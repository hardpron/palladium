require_relative '../../api/api'
require 'json'
describe 'Unit tests' do
  before :all do
    @api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')
  end

  describe 'Products' do

    before :all do
      @product_name = "name#{Time.now.nsec}"
      @product_status = "status#{Time.now.nsec}"
      @product_version = "version#{Time.now.nsec}"
      @api.add_new_product({:product => {:name => @product_name, :status => @product_status, :version => @product_version}})
    end

    it 'add_new_product' do
      params = {:product => {:name => "name#{Time.now.nsec}", :status => "status#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
      @api.add_new_product(params)
      response = JSON.parse(@api.get_products_by_param({:name => params[:product][:name]}))
      expect(response.values.size).to eq 1
    end

    it 'get_all_products' do
      responce = JSON.parse @api.get_all_products
      expect(responce).not_to be_empty
    end

    it 'get_products_by_param' do
      response = JSON.parse(@api.get_products_by_param({:name => @product_name}))
      expect(response.values.first['ProductName']).to eq(@product_name)
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
      @api.delete_product(response.keys.first)
      response = JSON.parse(@api.get_products_by_param({:name => current_product_data['ProductName']}))
      expect(response).to be_empty
    end

  end

  describe 'Plans' do
    it 'get_all_plans' do
      responce = JSON.parse @api.get_all_plans
      expect(responce).not_to be_empty
    end

    it 'get_plan_by_param' do
      response = JSON.parse(@api.get_plans_by_param({:name => 'name'}))
      expect(response.values.first['PlanName']).to eq('name')
    end

    it 'add_new_plan' do
        params = {:plan => {:name => "name#{Time.now.nsec}", :version => "version#{Time.now.nsec}"}}
        @api.add_new_plan(params)
        response = JSON.parse(@api.get_plans_by_param({:name => params[:plan][:name]}))
        expect(response.values.first['PlanName']).to eq params[:plan][:name]
    end
  end
end
