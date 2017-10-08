class ContactsController < ApplicationController
  
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
      @dynamic_models.each do |model_name|
        instance_variable_set("@"+model_name.to_s.pluralize.downcase, model_name.where(klaas: model_name.to_s))
        # debugger
      end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    set_contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    klass = Contact.create_model_class(params[:contact][:klaas], params[:contact])
    
    set_contact = klass.new(contact_params)
    

    respond_to do |format|
      if set_contact.save
        format.html { redirect_to contact_url set_contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: (contact_url set_contact) }
      else
        format.html { render :new }
        format.json { render json: set_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if set_contact.update(contact_params)
        format.html { redirect_to contact_url set_contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: (contact_url set_contact) }
      else
        format.html { render :edit }
        format.json { render json: set_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    set_contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      klass = Contact.create_model_class(Contact.find(params[:id]).klaas, params[:contact])
      # @contact = klass.find(params[:id])
      instance_variable_set("@"+klass.to_s.downcase,klass.find(params[:id]))
      # debugger
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      debugger
        params.require(:vin).permit(*Contact.new.dynamic_attributes.map(&:name), :name, :klaas)
    end
end
