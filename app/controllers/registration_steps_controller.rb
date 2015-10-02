class RegistrationStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :professional, :authorize

  def show
    puts "RegistrationStepsController.show()"
    @candidate = Candidate.new
    render_wizard
  end

  def update
    puts "RegistrationStepsController.update()"
    # @TODO: how to verify params[:candidate][:id] is for the user who just signed up?
    puts session.awesome_inspect
    @candidate = Candidate.find session[:candidate_id]
    @candidate.update candidate_params(params[:id])
    render_wizard @candidate
  end

  private
    def candidate_params(step)
      puts "RegistrationStepsController.candidate_params(#{step})"
      permitted_attributes =
        case step
          when 'personal'
            [:name, :email]
          when 'professional'
            [:current_profession, :years_experience, :desired_profession, :desired_location, :work_status]
          end

      params.require(:candidate).permit(permitted_attributes)
    end
end
