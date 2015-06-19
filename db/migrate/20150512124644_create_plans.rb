class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :version
      t.string :status
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
