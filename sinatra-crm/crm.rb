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
	@sorted_list = Contact.all.order(:first_name)
	@contact_count = @contact_list.length 
	@title = 'contact list'
	erb :contactlist
end 

get '/about' do
	@title = 'about'
	erb :about
end 

get '/contacts/new' do
	@title = 'Create new Contact'
	erb :new
end 

get '/contacts/:id' do
	id = params[:id].to_i
	@contact = Contact.find_by({id: id})	#@contact gets assigned the result of find_by method in active record. find_by takes hash as argument. 
	@title = 'contact:'+ @contact.full_name
	if @contact
		erb :show_contact
	else 
		raise Sinatra::NotFound 
	end 
end 

post '/contacts' do 
	#if params[:first_name] != '' && params[:last_name] != '' && params[:email] != '' && params[:note] != ''
		Contact.create({
			first_name: params[:first_name].strip,	#using .strip to take white space out after the first name
			last_name: 	params[:last_name].strip,
			email:  	params[:email].strip,
			note:  		params[:note].strip
		})
	#else 
		#p "error"
	#end 
	@new_contact_name = params[:first_name]
	redirect to('/new_contact_success')
end 

get '/new_contact_success' do
	title = Contact.last
	@title = title.full_name
	@new_contact_name = @title

	erb :new_contact_success
end 

get '/contacts/:id/edit' do 
	@contact = Contact.find_by({id: params[:id].to_i})
	if @contact 
		erb :edit_contact
	else 
		raise Sinatra::NotFound 
	end 
end 

put '/contacts/:id' do 
	@contact = Contact.find_by({id: params[:id].to_i})
	if @contact
	@contact.update({
		first_name: 	params[:first_name],
		last_name: 		params[:last_name],
		email: 			params[:email],
		note: 			params[:note] 
	})
	redirect to('/')
	else 
		raise Sinatra::NotFound
	end
end 

delete '/contacts/:id/delete' do 
	@contact = Contact.find_by({id: params[:id].to_i})
	if @contact
		@contact.delete
		redirect to('/')
	else 
		raise Sinatra::NotFound
	end 
end 



after do
  ActiveRecord::Base.connection.close
end

