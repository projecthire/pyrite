class Contact < ActiveRecord::Base
  validates :email, email: true, presence: true, uniqueness: true
end
