require_relative 'contact.rb'


class CRM

  def initialize

  end

  def main_menu
    i = 0
    while i != 1  
      print_main_menu
      user_selected = gets.chomp.to_i
      
      if user_selected == 6
        i = 1
      end 

      call_option(user_selected)

    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by ID"
    puts "[6] Exit"
    puts "enter a number"

  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_id
    end 
  end
#add_new contact calls on Contact class which then calls on the create method in the active_record class 
  def add_new_contact 
    p "enter the first name"
    first_name = gets.chomp 
    p "enter the last name "
    last_name = gets.chomp 
    p "enter the email"
    email = gets.chomp 
    p "enter notes about this contact"
    note = gets.chomp
    contact = Contact.create(
      first_name: first_name, 
      last_name: last_name, 
      email: email, 
      note: note
      )
  end 

  def search_by_id 
    p "enter the id of the contact you want to search for"
    id = gets.chomp
    search = Contact.find(id)
    p search
  end 

  def display_all_contacts
    all_contacts = Contact.all
    all_contacts.each do |contact|
      p "--------------------------"
      p "name:#{contact.full_name}"
      
      p "information:#{contact.rest}"
      p "--------------------------"
    end 



    # p all_contacts
  end 



end

menue = CRM.new

puts menue.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end

