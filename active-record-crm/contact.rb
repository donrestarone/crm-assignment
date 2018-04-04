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
    obj=0 #obj starts at zero
    @@contacts.each do |contact|
      if contact.id_reader == id  #contact.id_reader; here contact block variable calls on the return value of id_reader
          obj =1                  # if the condition is met, obj becomes 1, if not its zero. being zero triggers the error
         return contact         
      end

        if obj !=1
          return  "contact not found"
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

 
  def self.find_by_first_name(first_name) 
    obj = 0
    # p first_name
    @@contacts.each do |contact|
      # p contact.first_name
      if contact.first_name == first_name    #contact block variable calls on first_name method's return value. 
        obj = 1     
        #p contact.first_name                       #use of obj is the same as before.
        return contact
      end
    end 
    if obj != 1 
       return "error"
     end 
  end 


  def self.delete_all
    @@contacts = []
    return @@contacts
  end 



  def delete
    @@contacts.delete(self) #delete using built in method delete
  end 
                                                              #and invokes built in delete_if method. block variable contact
                                                                  #calls on the reader method first_name, and if the argument matches the object, its deleted. 
  
end

#testing create 3 people. 
# clark = Contact.new('Clark', 'kent', 'clark@clark.com', 'hello')
# diana = Contact.new('diana', 'prince', 'diana@amazon.com') #set default value for the notes argument, check other file 
# #create works 
# bruce = Contact.create('Bruce', 'Wayne', 'bruce@wayne.com', 'dark guy') #saves it by default 

# puts clark.inspect
# puts diana.inspect
# puts bruce.inspect

# diana.save
# clark.save

# puts Contact.all.inspect

# puts
# puts Contact.all.inspect 

# puts 
# #testing readers 
# puts diana.full_name.inspect #print full name works 
# puts diana.email.inspect #print email works 
# puts clark.notes.inspect
# puts diana.notes.inspect

# #testing writers
# clark.first_name=('Clark')
# puts clark.inspect
# diana.last_name=('Prince')
# puts diana.inspect
# clark.email=('clark@gmail.com')
# puts clark.inspect
# diana.notes=('royal')
# puts diana.inspect

# # puts 
# # puts
#  puts Contact.find(1005).inspect

#  puts 
#  puts 

# puts Contact.find_by_first_name("diana").inspect

# #Contact.delete_all
# puts
# puts

#  puts Contact.all.inspect
# puts
#  puts
#  # Contact.deletebyname("diana")
# puts 
# puts
#  puts Contact.all.inspect


# puts clark.id_reader.inspect

# #clark.delete


#  puts Contact.all.inspect



