class CreateCandidateDesiredProfessions < ActiveRecord::Migration
  def change
    create_table :candidate_desired_professions do |t|
      t.belongs_to :candidate, index: true, foreign_key: true
      t.belongs_to :desired_profession, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
