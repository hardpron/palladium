# join table
class CreateProductsRuns < ActiveRecord::Migration
  def change
    create_table :products_runs, id: false do |t|
      t.integer :product_id
      t.integer :run_id
    end
  end
end
