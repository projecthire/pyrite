class CreateDesiredLocations < ActiveRecord::Migration
  def change
    create_table :desired_locations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
