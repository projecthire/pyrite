class CandidatesController < ApplicationController
  def dashboard
    render 'candidates/dashboard.html.slim'
  end

  def email_valid
    is_valid = !Candidate.exists?(email: params[:candidate][:email])
    respond_to do |format|
      format.json { render json: {valid: is_valid} }
    end
  end
end
