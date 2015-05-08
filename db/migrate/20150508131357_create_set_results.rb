class CreateSetResults < ActiveRecord::Migration
  def change
    create_table :set_results do |t|
      t.string :title
      t.string :data
      t.string :version
      t.integer :status
      t.integer :run_id
      t.timestamps null: false
    end
  end
end
