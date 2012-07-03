require 'spec_helper'

describe SessionsController do
  context 'create action' do
    let(:contact) do
      contact = Contact.create! do |contact|
        contact.email = Random.email
        contact.first_name = Random.firstname
        contact.last_name = Random.lastname
        contact.phone = Random.phone
      end
    end

    before { post :create, id: contact.id }

    it 'should assign the contact_id to the session' do
      session[:contact_id].should == contact.id
    end

    it 'should redirect to show contact' do
      response.should redirect_to(contact_path(contact))
    end
  end
end
