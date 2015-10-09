class Candidate < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin]

  has_one :contact, foreign_key: :email, primary_key: :email
  has_one :linkedin_auth

  has_many :candidate_desired_professions
  has_many :desired_professions, through: :candidate_desired_professions
  has_many :candidate_desired_locations
  has_many :desired_locations, through: :candidate_desired_locations

  enum years_experience: [:'0-2', :'3-5', :'5-8', :'9+']
  enum current_profession: [:consultant, :banker, :mba_student, :undergrad_student, :trader, :accountant, :engineer]
  enum work_status: [:us_citizen, :h1b_visa, :other_us_work_visa, :none_of_the_above]

  accepts_nested_attributes_for :desired_professions
  accepts_nested_attributes_for :desired_locations

  validates :email, email: { message: I18n.t("coming_soon.form.state.email.errors.invalid") },
                    uniqueness: { message: I18n.t("coming_soon.form.state.email.errors.duplicate") },
                    presence: { message: I18n.t("coming_soon.form.state.email.errors.missing") }
  validates :name, presence: { message: I18n.t("coming_soon.form.state.name.errors.missing") }

  def password_required?
    new_record? ? false : super
  end
end
