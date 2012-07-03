class SessionsController < ApplicationController

  def create
    session[:contact_id] = params[:id].to_i
    redirect_to contacts_path(params[:id])
  end

end
