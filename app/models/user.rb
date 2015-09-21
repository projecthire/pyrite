class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_one :contact, foreign_key: :email, primary_key: :email

  validates :email, email: true

  def guest?
    self.role.nil?
  end

  def super_admin?
    self.role.name == 'SuperAdmin'
  end

  def support_admin?
    self.role.name == 'SupportAdmin'
  end

  def content_admin?
    self.role.name == 'ContentAdmin'
  end

  def admin?
    self.super_admin? || self.support_admin? || self.content_admin?
  end

end
