require_relative 'DataHelper'
require_relative 'APIShell'
@palladium = nil
describe 'Multiplication' do
  (1..1).to_a.each do |i|


  describe 'Correct' do
    (1..100).to_a.each do |current_element_second|
      it "#{current_element_second}" do
        @palladium = APIShell.new 'CDE', 'plan_5', "Multiplication Tests_#{i}"
        expect(current_element_second*2).to eq(current_element_second*2)
        end
      end
      after :each do |example|
        @palladium.add_result(example)
      end
  end
  end



end