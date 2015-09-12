class AddFirstNameLastNameToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    rename_column :contacts, :name, :full_name
  end
end
