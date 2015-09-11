class Contact < ActiveRecord::Base
  validates :email, email: true
end
