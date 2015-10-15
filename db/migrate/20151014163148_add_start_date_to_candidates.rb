class AddStartDateToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :start_date, :datetime
  end
end
