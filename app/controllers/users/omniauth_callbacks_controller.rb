module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # load_and_authorize_resource

    def linkedin
      # User _must_ be logged in before authenticating with LinkedIn
      # i.e. User cannot use LinkedIn to login to site
      @user = current_user
      omniauth_hash = request.env["omniauth.auth"]

      @linkedin_auth = LinkedinAuth.find_or_create_by(user_id: @user.id) do |linkedin_auth|
          linkedin_auth.linkedin_uid = omniauth_hash.uid
      end

      # @TODO: only update if changed/expired
      @linkedin_auth.update(
          token: omniauth_hash.credentials.token,
          secret: omniauth_hash.credentials.secret
      )

      redirect_to edit_user_registration_path,
                  notice: "Successfully authorized LinkedIn using email: #{omniauth_hash.info.email}"
    end
  end
end
