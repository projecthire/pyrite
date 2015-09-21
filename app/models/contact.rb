class Contact < ActiveRecord::Base
  validates :email, email: { message: I18n.t("coming_soon.form.state.email.errors.invalid") },
                    uniqueness: { message: I18n.t("coming_soon.form.state.email.errors.duplicate") },
                    presence: { message: I18n.t("coming_soon.form.state.email.errors.missing") }
  validates :name, presence: { message: I18n.t("coming_soon.form.state.name.errors.missing") }
end
