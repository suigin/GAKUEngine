class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :birth_date
end