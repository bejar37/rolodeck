require 'spec_helper'

describe Contact do
  before do
    @contact = Contact.new(
      email: "test@user.com",
      first_name: "Test",
      last_name: "User",
      phone: "6175551212"
      )
  end

  subject { @contact }

  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :email }
  it { should respond_to :phone }
  it { should be_valid }

  describe "validation errors" do
    subject { @contact }

    it "should require email" do
      @contact.email = ""
      should_not be_valid
    end

    it "should require first_name" do
      @contact.first_name = ""
      should_not be_valid
    end

    it "should require last_name" do
      @contact.last_name = ""
      should_not be_valid
    end

    it "should require phone" do
      @contact.phone = ""
      should_not be_valid
    end

    it "should have phone be 10 or 11 digits long" do
      @contact.phone = "1234567890"
      should be_valid

      @contact.phone = "12345678901"
      should be_valid

      @contact.phone = "123456789"
      should_not be_valid
    end

    it "should require unique email" do
      @contact.save
      @contact_dupe = @contact.dup
      @contact_dupe.should_not be_valid
    end

    it "should require a unique email, case insensitive" do
      @contact.save
      @contact_dupe = @contact.dup
      @contact_dupe.email = @contact.email.upcase
      @contact_dupe.should_not be_valid
    end

  end
end
