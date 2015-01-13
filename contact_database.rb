contacts = CSV.read('contacts.csv')
puts "Database connected"

class ContactDatabase
  def self.write(contact)
    CSV.open('contacts.csv', 'a') do |new_contact|
      new_contact << [contact.first_name, contact.last_name, contact.email, contact.phone_number, contact.importance]
    end
  end
end