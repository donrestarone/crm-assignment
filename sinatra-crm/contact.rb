gem 'activerecord', '=4.2.10' #when we are using active record make sure its this version, not the other version we have installed in our machine. 
require 'active_record'
require 'mini_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base
  field :first_name, as: :string 
  field :last_name , as: :string 
  field :email, as: :text 
  field :note, as: :text 
  
  def full_name
  "#{first_name} #{last_name}"
  end

  def email 
  	"#{email}"
  end 

 def rest
  "  #{email} // #{note}"
  end   

end
Contact.auto_upgrade!



