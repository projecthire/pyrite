class AddUserToLinkedinAuths < ActiveRecord::Migration
  def change
    add_reference :linkedin_auths, :user, index: true, foreign_key: true
  end
end
