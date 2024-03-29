module Candidates
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def linkedin
      @candidate = Candidate.find_by_confirmation_token session[:candidate_confirmation_token]
      omniauth_hash = request.env["omniauth.auth"]

      @linkedin_auth = LinkedinAuth.find_or_create_by(candidate_id: @candidate.id) do |linkedin_auth|
          linkedin_auth.linkedin_uid = omniauth_hash[:uid]
      end

      @linkedin_auth.update(
          token: omniauth_hash[:credentials][:token],
          secret: omniauth_hash[:credentials][:secret]
      )

      reset_session

      redirect_to new_candidate_session_path,
                  notice: t("marketing.candidate_registration_wizard.authorize_step.success_msg")
    end

    def after_omniauth_failure_path_for(scope)
      candidates_registration_wizard_path(id: :authorize)
    end
  end
end
