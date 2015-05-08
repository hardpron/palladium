class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :version
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
