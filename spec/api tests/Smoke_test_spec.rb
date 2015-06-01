require_relative '../../api/api'
require 'json'
describe 'Products' do

  before :all do
    @api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')
    @api.add_new_product({:product => {:name => 'name', :status => 'status', :version => 'version'}})
  end

  it 'get_all_products' do
    responce = JSON.parse @api.get_all_products
    expect(responce.keys.size).to be >= 1
  end

  it 'get_products_by_param' do
    name = "name#{Time.now.nsec}"
    params = {:product => {:name => name, :status => 'status', :version => 'version'}}
    @api.add_new_product(params)
    response = JSON.parse(@api.get_products_by_param({:name => name}))
    expect(response.values.first['ProductName']).to eq(name)
  end

  it 'Add new product' do
    params = {:product => {:name => 'name', :status => 'status', :version => 'version'}}
    expect(@api.add_new_product(params).code).to eq('302')
  end
end
