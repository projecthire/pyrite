class Candidate < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contact, foreign_key: :email, primary_key: :email

  validates :email, email: { message: I18n.t("coming_soon.form.state.email.errors.invalid") },
                    uniqueness: { message: I18n.t("coming_soon.form.state.email.errors.duplicate") },
                    presence: { message: I18n.t("coming_soon.form.state.email.errors.missing") }
  validates :name, presence: { message: I18n.t("coming_soon.form.state.name.errors.missing") }
end
