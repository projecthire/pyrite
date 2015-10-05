class Candidate < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contact, foreign_key: :email, primary_key: :email

  validates :email, email: { message: I18n.t("coming_soon.form.state.email.errors.invalid") },
                    uniqueness: { message: I18n.t("coming_soon.form.state.email.errors.duplicate") },
                    presence: { message: I18n.t("coming_soon.form.state.email.errors.missing") }
  validates :name, presence: { message: I18n.t("coming_soon.form.state.name.errors.missing") }

  enum years_experience: [:'0-2', :'3-5', :'5-8', :'9+']
  enum current_profession: [:consultant, :banker, :mba_student, :undergrad_student, :trader, :accountant, :engineer]
  enum desired_profession: [:hedge_fund, :private_equity, :other]
  enum desired_location: [:new_york_city, :san_franciso, :london, :chicago, :boston, :hong_kong, :los_angeles]
  enum work_status: [:us_citizen, :h1b_visa, :other_us_work_visa, :none_of_the_above]

  def password_required?
    new_record? ? false : super
  end
end
