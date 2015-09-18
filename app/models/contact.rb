class Contact < ActiveRecord::Base
  validates :email, email: true
  belongs_to :user, foreign_key: :email, primary_key: :email
end
