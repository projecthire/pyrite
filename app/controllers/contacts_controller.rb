class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.js {}
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def contact_params
      clean_params = params.require(:contact).permit(:full_name, :email)
      name_parts = clean_params[:full_name].rpartition ' '
      {
          full_name: clean_params[:full_name],
          first_name: name_parts[0],
          last_name: name_parts[-1],
          email: clean_params[:email]
      }
    end
end
