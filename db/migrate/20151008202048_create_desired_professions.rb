class CreateDesiredProfessions < ActiveRecord::Migration
  def change
    create_table :desired_professions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
