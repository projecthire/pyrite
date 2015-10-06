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

      redirect_to candidate_dashboard_path,
                  notice: "Successfully authorized LinkedIn with email: #{omniauth_hash[:info][:email]}"
    end
  end
end
