class CreateTestCases < ActiveRecord::Migration
  def change
    create_table :test_cases do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
