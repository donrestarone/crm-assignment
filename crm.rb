require_relative 'contact.rb'


class CRM

  def initialize

  end

  def main_menu
    while true 
      print_main_menu
      user_selected = gets.chomp.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Search by attribute"
    puts "[6] Exit"
    puts "enter a number"

  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then raise "quit "
    end 
  end

  def add_new_contact
    p "enter first name"
    first_name = gets.chomp 
    p "enter last name"
    last_name = gets.chomp 
    p "enter email"
    email = gets.chomp 
    p "enter notes about the person"
    notes = gets.chomp

    Contact.create(first_name, last_name, email, notes) 
  end

  def modify_existing_contact
    p "modify works"
  end

  def delete_contact
    p "enter the first name"
      answer = gets.chomp.to_s
    found_contact = Contact.find_by_first_name(answer)
    p found_contact
    found_contact.delete
  end

  def display_all_contacts
    Contact.all.each do |contact|
    puts "name: #{contact.full_name}"
    puts "----------------------------------"
    puts "email: #{contact.email}"
    puts "----------------------------------"
    puts "notes: #{contact.notes}"
    puts "----------------------------------"
    puts "unique ID: #{contact.id_reader}"
    puts "----------------------------------"
    end

  end

  def search_by_attribute
    p "search works"
  end


end

menue = CRM.new

puts menue.main_menu

