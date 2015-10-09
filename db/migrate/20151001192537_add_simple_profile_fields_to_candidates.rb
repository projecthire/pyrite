class AddSimpleProfileFieldsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :current_profession, :integer
    add_column :candidates, :years_experience, :integer
    add_column :candidates, :work_status, :integer
  end
end
