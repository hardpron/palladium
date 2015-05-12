class CreateResultSets < ActiveRecord::Migration
  def change
    create_table :result_sets do |t|
      t.string :status
      t.string :version
      t.string :run_is

      t.timestamps null: false
    end
  end
end
