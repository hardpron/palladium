class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :name
      t.string :version
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end