class Contact
  # class ShortPassError < StandardError
  # end
 
  attr_accessor :first_name, :last_name, :email, :phone_number, :id
 
  def initialize(first_name, last_name, email, phone_number)
    @first_name =   first_name
    @last_name =    last_name
    @email =        email
    @phone_number = phone_number
    @id =           ContactDatabase.get_next_id
  end
 
  def to_s
    "Name: #{first_name} #{last_name}, Mobile: (#{phone_number}), Email:(#{email}), ID: (#{id})"
  end
 
  # Class Methods

  def self.create(first_name, last_name, email, phone_number)
    Contact.new(first_name, last_name, email, phone_number)
  end

  def self.all
    all = ContactDatabase.read_from_csv
    puts all
  end
  
  def self.find(id)
    contacts = ContactDatabase.read_from_csv
    contacts.each do |contact|
      if contact.first == id
        return contact
      end
    end
  end  
  
  def self.show(id)
    contacts = ContactDatabase.read_from_csv
    contacts.each do |contact|
      if contact.last == id
        return contact
      end
    end
  end
end