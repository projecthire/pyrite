class CreateLinkedinAuths < ActiveRecord::Migration
  def change
    create_table :linkedin_auths do |t|
      t.string :linkedin_uid
      t.string :token
      t.string :secret

      t.timestamps null: false
    end
  end
end
