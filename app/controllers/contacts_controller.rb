class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def edit
    begin
      @contact = Contact.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @contact = nil
    end
  end

  def show
    begin
      @contact = Contact.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @contact = nil
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_url, notice: 'Contact destroyed'
  end


end
