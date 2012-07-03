class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_current_contact_name

  def get_current_contact_name
    if session[:contact_id].present?
      @contact_name = Contact.find(session[:contact_id]).first_name
    else
      @contact_name =  ''
    end
  end
end
