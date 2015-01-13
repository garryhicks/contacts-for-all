@testabc = 83

class Contact
  # class ShortPassError < StandardError
  # end
 
  attr_accessor :first_name, :last_name, :email, :phone_number, :importance
 
  def initialize(first_name, last_name, email, phone_number, importance)
    @first_name =   first_name
    @last_name =    last_name
    @email =        email
    @phone_number = phone_number
    @importance =   importance
  end
 
  def to_s
    "Name: #{first_name} #{last_name}, Mobile: (#{phone_number}), Email:(#{email}), Level: #{importance}"
  end
 
  # Class Methods

  def self.create(first_name, last_name, email, phone_number, importance)
    Contact.new(first_name, last_name, email, phone_number, importance)
  end

  def self.all
    all = CSV.open('contacts.csv')
    puts all
  end
  
  def self.find(id)
    Contact.detect {|contact| contact.id.include?(id)}
  end  

  
end