require_relative 'DataHelper'
require_relative 'APIShell'

describe 'Multiplication' do
  palladium = APIShell.new 'CDE', 'plan_1', "Multiplication Tests_18"
  describe 'Correct' do
      (1..100).to_a.each do |current_element_second|
        it "#{current_element_second}" do
          expect(current_element_second*2).to eq(current_element_second*2)
        end
      end
  end

  after :each do |example|
    palladium.add_result(example)
  end
end