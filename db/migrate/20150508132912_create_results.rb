class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :status
      t.string :author
      t.string :message
      t.integer :set_result_id

      t.timestamps null: false
    end
  end
end
