class Contact
  # class ShortPassError < StandardError
  # end
 
  attr_accessor :first_name, :last_name, :email, :phone_number
 
  def initialize(first_name, last_name, email, phone_number)
    @first_name =   first_name
    @last_name =    last_name
    @email =        email
    @phone_number = phone_number
  end
 
  def to_s
    "Name: #{first_name} #{last_name}, Mobile: (#{phone_number}), Email:(#{email})"
  end
 
  # Class Methods

  def self.create(first_name, last_name, email, phone_number)
    Contact.new(first_name, last_name, email, phone_number)
  end

  def self.all
    all = CSV.open('contacts.csv')
    puts all
  end
  
  def self.find(id)
    Contact.detect {|contact| contact.id.include?(id)}
  end  
  
end