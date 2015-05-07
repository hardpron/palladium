class CreateSetResults < ActiveRecord::Migration
  def change
    create_table :set_results do |t|
      t.integer :run_id
      t.string  :title

      t.timestamps null: false
    end
  end
end
