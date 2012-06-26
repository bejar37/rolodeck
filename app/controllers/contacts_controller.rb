class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
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
end
