class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :omniauthable :registerable,
  # :recoverable and :validatable

  devise :database_authenticatable, :rememberable, :timeoutable,
         :trackable, :lockable
end
