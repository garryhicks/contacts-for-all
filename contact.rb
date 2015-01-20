class Contact
  
  attr_reader :id 
  attr_accessor :first_name, :last_name, :email, :phone_number
 
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

  def save

  end
 
  # Class Methods
  class << self

    def create(first_name, last_name, email, phone_number)
      Contact.new(first_name, last_name, email, phone_number)
    end

    def all
      all = ContactDatabase.read_from_csv
      puts all
    end
    
    def find(id)
      contacts = ContactDatabase.read_from_csv
      contacts.each do |contact|
        if contact.first == id
          return contact
        end
      end
    end  
    
    def show(id)
      contacts = ContactDatabase.read_from_csv
      contacts.each do |contact|
        if contact.last == id
          return contact
        end
      end
    end
  end
end