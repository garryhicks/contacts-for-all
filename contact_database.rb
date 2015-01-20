require 'csv'

contacts = CSV.read('contacts.csv')
puts "Database connected"

class ContactDatabase

@@csv_data = []

  class << self

    def write(contact)
      CSV.open('contacts.csv', 'a') do |new_contact|
        new_contact << [contact.first_name, contact.last_name, contact.email, contact.phone_number, contact.id]
      end
    end

    def read_from_csv
      @@csv_data =  CSV.read('contacts.csv', 'r')
    end

    def get_next_id
      all_contacts = self.read_from_csv
      max_id = 0
      all_contacts.each do |contact|
        current_id = contact.last.to_i
        if current_id > max_id
          max_id = current_id
        end
      end
      return max_id + 1
    end
  end
end