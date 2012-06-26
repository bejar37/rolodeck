class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone

  validates :email, :first_name, :last_name, :phone, presence: true
end
