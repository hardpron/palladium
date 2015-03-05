class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :status
      t.string :version
      t.string :update_data

      t.timestamps null: false
    end
  end
end
