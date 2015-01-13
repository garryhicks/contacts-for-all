class Contact
  class ShortPassError < StandardError
  end

  require 'byebug'
 
  attr_accessor :name, :email, :mobile_phone
 
  def initialize(first_name, last_name, email, mobile_phone, importance)
    @first_name =   first_name
    @last_name =    last_name
    @email =        email
    @mobile_phone = mobile_phone
    @importance =   importance

  end
 
  def to_s
    "Name: #{first_name} #{last_name}, Mobile: (#{mobile_phone}), Email:(#{email}), Level: #{importance}"
  end
 
  ## Class Methods
  # class << self
  #   def create(first_name, last_name, email, mobile_phone, importance)
  #     Contact.new(first_name, last_name, email, mobile_phone, importance)
  #   end
 
  #   def self.all
  #     contact = Contact.all
  #   end
    
  #   def self.find(name)
  #     self.all.select {|contact| contact.name.include?(name)}
  #   end
    
  # end
 
end