class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :title
      t.string :version
      t.string :data
      t.integer :plan_id

      t.timestamps null: false
    end
  end
end
