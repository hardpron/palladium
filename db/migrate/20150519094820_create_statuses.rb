class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :color
      t.boolean :main_status, :default => false

      t.timestamps null: false
    end
  end
end
