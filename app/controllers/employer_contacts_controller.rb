class EmployerContactsController < ApplicationController
  def new
    @employer_contact = EmployerContact.new
  end

  def create
    @employer_contact = EmployerContact.create(employer_contact_params)
    if @employer_contact.persisted?
      redirect_to employers_landing_path, notice: I18n.t("marketing.employer_contact.success")
    else
      puts @employer_contact.errors.awesome_inspect
    end
  end

  private
    def employer_contact_params
      clean_params = params.require(:employer_contact).permit(:name, :email, :company, :message)
      # @TODO: abstract out into concern?
      name_parts = clean_params[:name].rpartition(' ').delete_if(&:empty?)
      # if only given single name use it as first_name
      (name_parts.size > 1) ?
          {
              name: clean_params[:name],
              first_name: name_parts[0],
              last_name: name_parts[-1],
              email: clean_params[:email],
              company: clean_params[:company]
          } :
          {
              name: clean_params[:name],
              first_name: name_parts[0],
              email: clean_params[:email],
              company: clean_params[:company]
          }
    end
end
