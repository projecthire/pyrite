class RegistrationWizardController < ApplicationController
  include Wicked::Wizard
  steps :personal, :professional, :authorize

  def show
    @candidate = Candidate.find_by_confirmation_token session[:candidate_confirmation_token]
    render_wizard
  end

  def update
    @candidate = Candidate.find_by_confirmation_token session[:candidate_confirmation_token]
    @candidate.update candidate_params(params[:id])
    render_wizard @candidate
  end

  private
    def candidate_params(step)
      permitted_attributes =
        case step
          when 'personal'
            [:name, :email]
          when 'professional'
            [:current_profession, :years_experience, :desired_profession,
             :desired_location, :work_status, :password, :password_confirmation]
          end

      params.require(:candidate).permit(permitted_attributes)
    end
end
