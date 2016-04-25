class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.text :message, null: false
      t.integer :lifespan_in_hours, null: false, default: 12

      t.timestamps
    end
  end
end
