require_relative '../../api/api'
require 'json'
describe 'Products' do

  before :all do
    @api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')
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
    expect(responce.keys.size).to be >= 1
  end

  it 'get_products_by_param' do
    response = JSON.parse(@api.get_products_by_param({:name => @product_name}))
    expect(response.values.first['ProductName']).to eq(@product_name)
  end
end
