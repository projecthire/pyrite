class AddCandidateToLinkedinAuths < ActiveRecord::Migration
  def change
    add_reference :linkedin_auths, :candidate, index: true, foreign_key: true
  end
end
