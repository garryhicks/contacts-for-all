class Contact
  # class ShortPassError < StandardError
  # end
 
  attr_accessor :first_name, :last_name, :email, :phone_number, :id
 
  def initialize(first_name, last_name, email, phone_number, id)
    @first_name =   first_name
    @last_name =    last_name
    @email =        email
    @phone_number = phone_number
    @id =           id
  end
 
  def to_s
    "Name: #{first_name} #{last_name}, Mobile: (#{phone_number}), Email:(#{email}), ID: (#{id})"
  end
 
  # Class Methods

  def self.create(first_name, last_name, email, phone_number, id)
    Contact.new(first_name, last_name, email, phone_number, id)
  end

  def self.all
    all = CSV.open('contacts.csv')
    puts all
  end
  
  def self.find(id)
    Contact.detect {|contact| contact.id.include?(id)}
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