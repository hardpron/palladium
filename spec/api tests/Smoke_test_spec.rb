require_relative '../../api/api'
describe 'Products' do
  api = Api.new('localhost:3000', 'flamine@list.ru', '4s8Fq325PJmsD1frVSHx')

  it 'get_all_products' do
    expect(api.get_all_products[0]).to eq('{')
    expect(api.get_all_products[-1]).to eq('}')
  end

  it 'add_new_product' do
    expect(api.add_new_product('name', 'version', 'status').code).to eq('302')
  end
end
