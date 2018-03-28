 

class Contact
  @@contacts = []
  @@next_id = 1000
  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email 
    @notes = notes

    @id = @@next_id
    @@next_id += 1

  end

  def self.create(first_name, last_name, email, notes = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, notes)
    new_contact.save
    return new_contact
  end

  def save
    @@contacts.push self 
  end

  def self.all
    return @@contacts
  end 

  def id_reader
    return @id
  end

  def self.find(id)
    @@contacts.each do |contact|
      if contact.id_reader == id  #call on id_reader method to get all id's in the array and check them against id argument  
         return contact
      else 
        return "error"
      end
    end 
  end

  def first_name #reader
    @first_name
  end 

  def last_name ##reader
    @last_name
  end 

  def email #reader
    @email
  end 

  def notes #reader
    @notes
  end 

  def full_name
    "#{first_name} #{last_name}"

  end

  def update
  end

  def first_name=(first_name) #writer
    @first_name = first_name
  end 

  def last_name=(last_name) #writer
    @last_name = last_name
  end 

  def email=(email) #writer
    @email = email
  end 

  def notes=(notes) #writer
    @notes = notes 
  end 



  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.
  
end

#testing create 3 people. 
clark = Contact.new('Clark', 'kent', 'clark@clark.com', 'hello')
diana = Contact.new('diana', 'prince', 'diana@amazon.com') #set default value for the notes argument, check other file 
#create works 
bruce = Contact.create('Bruce', 'Wayne', 'bruce@wayne.com', 'dark guy') #saves it by default 

puts clark.inspect
puts diana.inspect
puts bruce.inspect
puts Contact.all.inspect 

diana.save
clark.save
# puts
# puts Contact.all.inspect 

puts 
#testing readers 
puts diana.full_name.inspect #print full name works 
puts diana.email.inspect #print email works 
puts clark.notes.inspect
puts diana.notes.inspect

#testing writers
clark.first_name=('lark')
puts clark.inspect
diana.last_name=('Prince')
puts diana.inspect
clark.email=('clark@gmail.com')
puts clark.inspect
diana.notes=('royal')
puts diana.inspect

puts 
puts
puts Contact.find(100)





