class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :date
      t.string :version
      t.string :status

      t.timestamps null: false
    end
  end
end
