module Candidates
  class RegistrationsController < Devise::RegistrationsController
    before_filter :configure_sign_up_params, only: [:create]
    before_filter :configure_account_update_params, only: [:update]

    protected
      # extra params to permit
      def configure_sign_up_params
        devise_parameter_sanitizer.for(:sign_up) << [
            :name, :current_profession, :years_experience,
            :desired_profession, :desired_location, :work_status
        ]
      end

      # extra params to permit
      def configure_account_update_params
        devise_parameter_sanitizer.for(:account_update) << [
            :name, :current_profession, :years_experience,
            :desired_profession, :desired_location, :work_status
        ]
      end

      # The path used after sign up.
      def after_sign_up_path_for(resource)
        session[:candidate_confirmation_token] = resource.confirmation_token
        candidates_registration_wizard_path(id: :professional)
      end

      def after_inactive_sign_up_path_for(resource)
        session[:candidate_confirmation_token] = resource.confirmation_token
        candidates_registration_wizard_path(id: :professional)
      end

      def after_update_path_for(resource)
        session[:candidat_confirmation_token] = resource.confirmation_token
        candidates_registration_wizard_path(id: :professional)
      end
  end
end
