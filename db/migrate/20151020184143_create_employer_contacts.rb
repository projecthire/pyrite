class CreateEmployerContacts < ActiveRecord::Migration
  def change
    create_table :employer_contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :company
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
