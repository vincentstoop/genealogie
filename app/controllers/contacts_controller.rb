class ContactsController < ApplicationController
  
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    # instance_variable_set("@"+klass.to_s.pluralize,klass.all)
    
    # if URI == "/contacts/" we want all contacts
    if params[:type].blank?
      @contacts = Contact.all
    else
      # else (when URI == "/contacts/:type" we want only contacts of that type)
      @contacts = Contact.where(klaas: params[:type].camelcase)
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    klass = Contact.create_model_class(params[:contact][:klaas], params[:contact])
    
    @contact = klass.new(contact_params)
    debugger

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: (contact_url @contact) }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: (contact_url @contact) }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      # debugger
      klass = Contact.create_model_class(Contact.find(params[:id]).klaas, params[:contact])

      @contact = klass.find(params[:id])
      # instance_variable_set("@"+klass.to_s,klass.find(params[:id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
        params.require(:contact).permit(*Contact.new.dynamic_attributes.map(&:name), :name, :klaas)
    end
end
