class Quote < ActiveRecord::Base
  attr_accessible :company, :email, :first_name, :last_name, :phone_number, :project_description
end
