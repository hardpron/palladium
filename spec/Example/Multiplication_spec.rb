require_relative 'DataHelper'
require_relative 'APIShell'

product_name = 'Multiplication'
data = nil
set_name = ''
plan_data = ''
describe 'Multiplication' do

  # testrail = TestrailHelper.new SettingsEditors::DOCUMENT::PROJECT_NAME, name_of_suite, starter.plan_name do |testrail_config|
  #   testrail_config.ignore_parameters = starter.ignored_tags
  # end
  palladium = APIShell.new 'Multiplication', 'plan_first', 'Multiplication Tests1'
p
  describe 'Correct' do
    [1,2,3,4,5,6,7,8,9].each do |current_element_first|
      [1,2,3,4,5,6,7,8,9].each do |current_element_second|
        it "#{current_element_first}*#{current_element_second}" do
          set_name = "#{current_element_first}*#{current_element_second} Correct"
          result = current_element_first*current_element_second
          expect(DataHelper.get_result_by_params(current_element_first, current_element_second)).to eq(result)
        end
      end
    end
  end

  # describe 'Uncorrect' do
  #   [1,2,3,4,5,6,7,8,9].each do |current_element_first|
  #     [1,2,3,4,5,6,7,8,9].each do |current_element_second|
  #       it "#{current_element_first}*#{current_element_second}" do
  #         set_name = "#{current_element_first}*#{current_element_second} Uncorrect"
  #         run_name = 'Uncorrect'
  #         result = current_element_first*current_element_second
  #         expect(0).to eq(result)
  #       end
  #     end
  #   end
  # end

  after :each do |example|
    palladium.add_result(example)
  end
end