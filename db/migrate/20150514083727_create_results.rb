class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :status
      t.text :message
      t.string :author
      t.integer :result_set_id
      t.integer :result_id
      t.timestamps null: false
    end
  end
end
