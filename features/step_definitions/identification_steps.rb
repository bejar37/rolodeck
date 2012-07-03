Given /^I have a contact that represents me$/ do
  @contact = Contact.new
  @contact.email = Random.email
  @contact.first_name = Random.firstname
  @contact.last_name = Random.lastname
  @contact.phone = Random.phone

  @contact.save!
end

When /^I go to my show contact page$/ do
  visit contact_path(@contact)
end

When /^I press the login button$/ do
  click_on 'Login'
end

Then /^I see my name in the nav bar$/ do
  within('nav') do
    page.should have_content  @contact.first_name
  end
end
