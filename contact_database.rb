require 'csv'

contacts = CSV.read('contacts.csv')
puts "Database connected"
byebug
@@csv_data = []
class ContactDatabase

  def self.write(contact)
    CSV.open('contacts.csv', 'a') do |new_contact|
      new_contact << [contact.first_name, contact.last_name, contact.email, contact.phone_number]
    end
  end

  def convert_csv_to_contacts
    @contacts = Hash.new
    @contacts << @@csv_data
  end

  def self.read_from_csv
    @@csv_data =  CSV.read('contacts.csv', 'r')
  end
end