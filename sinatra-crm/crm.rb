require_relative 'contact.rb'
require 'sinatra'

get '/' do
  redirect to('/home')
end

get '/home' do
	@current_time = Time.now 
	@title = 'Customer Relations Manager'
	erb :index

end 

get '/contactlist' do
	@contact_list = Contact.all
	@contact_count = @contact_list.length 
	@title = 'contact list'
	erb :contactlist
end 

get '/about' do
	@title = 'about'
	erb :about
end 

get '/contacts/:id' do
	id = params[:id].to_i
	@contact = Contact.find_by({id: id})	#@contact gets assigned the result of find_by method in active record. find_by takes hash as argument. 
	
	if @contact
		erb :show_contact
	else 
		raise Sinatra::NotFound 
	end 
end 

# get '/contacts'

# class CRM
#   def main_menu
#     i = 0
#     while i != 1  
#       print_main_menu
#       user_selected = gets.chomp.to_i
      
#       if user_selected == 0 #the input to quit the whileloop.
#         i = 1
#       end 

#       call_option(user_selected)

#     end
#   end

#   def print_main_menu
#     puts "[1] Add a new contact"
#     puts "[2] Modify an existing contact"
#     puts "[3] Delete a contact"
#     puts "[4] Display all the contacts"
#     puts "[5] Search by ID"
#     puts "[6] Search by attribute"
#     puts "[7] delete contact"
#     puts "[8] Exit"
#     puts "[9] Exit"
#     puts "[0] EXIT]"

#   end

#   def call_option(user_selected)
#     case user_selected
#       when 1 then add_new_contact
#       when 2 then modify_existing_contact
#       when 3 then delete_contact
#       when 4 then display_all_contacts
#       when 5 then search_by_id
#       when 6 then search_by_attribute
#       when 7 then delete_contact
#     end 
#   end
# #add_new contact calls on Contact class which then calls on the create method in the active_record class 
#   def add_new_contact 
#     p "enter the first name"
#     first_name = gets.chomp 
#     p "enter the last name "
#     last_name = gets.chomp 
#     p "enter the email"
#     email = gets.chomp 
#     p "enter notes about this contact"
#     note = gets.chomp
#     contact = Contact.create(
#       first_name: first_name, 
#       last_name: last_name, 
#       email: email, 
#       note: note
#       )
#   end 

#   def search_by_id 
#     p "enter the id of the contact you want to search for"
#     id = gets.chomp
#     search = Contact.find(id)
#      p "--------------------------"
#       p "ID:#{search.id} NAME:#{search.full_name}"
      
#       p "INFORMATION:#{search.rest}"
#     p "--------------------------"
#   end 

#   def search_by_attribute 
#     p "enter the attribute you want to search by. OPTIONS: first_name, last_name, email, note"
#     input = gets.chomp
#     p "enter the search query"
#     search_query = gets.chomp
#     search_result = Contact.find_by(input => search_query )
#     p "--------------------------"
#       p "ID:#{search_result.id} NAME:#{search_result.full_name}"
      
#       p "INFORMATION:#{search_result.rest}"
#     p "--------------------------"
#   end 

#   def display_all_contacts
#     all_contacts = Contact.all
#     all_contacts.each do |contact|
#       p "--------------------------"
#       p "ID:#{contact.id} NAME:#{contact.full_name}"
      
#       p "INFORMATION:#{contact.rest}"
#       p "--------------------------"
#     end 
#   end 

#   def delete_contact
#     p "enter the ID of the contact you would like to delete"
#     id = gets.chomp 
#     search_result = Contact.find(id)
#     p "press y to confirm"
#     anykey = gets.chomp.to_s
#     if anykey == "y"
#       search_result.delete 
#       p "contact deleted successfully"
#     else 
#       p "error"
#     end 
    
#   end 

#   def modify_existing_contact
#   p "enter the id of the contact you want to edit"
#   id = gets.chomp 
#   desired_contact = Contact.find(id) #desired contact grabs the object that matches the ID 

#   p "what do you want to update. OPTIONS: first_name, last_name, email, note "
#   input = gets.chomp 
#   p "what content would you like to add?"
#   content = gets.chomp

#   desired_contact.update(input => content ) #if input matches the key in the array, it updates that key with the content. 
#   end
   



# end

# menue = CRM.new

# puts menue.main_menu

after do
  ActiveRecord::Base.connection.close
end

