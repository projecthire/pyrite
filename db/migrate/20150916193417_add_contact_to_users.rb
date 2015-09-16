class AddContactToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :contact, index: true, foreign_key: true
  end
end
