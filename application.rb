require 'csv'
require 'byebug'
require_relative 'contact'
require_relative 'contact_database'

command = ARGV[0]
cli_id = ARGV[1]

def menu
  puts " "
  puts "Welcome to the app. These are the commands available"
  puts " new                     - Create a new contact"
  puts " list                    - List all contacts"
  puts " show (<number here>)    - Display a single contact"
  puts " find (<term here>)      - Display a single contact"
  puts " "
end

def read_csv
  CSV.read('contacts.csv')
end

def create_contact
  puts "Please enter the first name:"
  first_name = STDIN.gets.chomp
  puts "Please enter the last name:"
  last_name = STDIN.gets.chomp
  puts "Please enter the email address, if you have one:"
  email = STDIN.gets.chomp
  puts "Please enter the phone number of your contact, eg 888-888-8888"
  phone_number = STDIN.gets.chomp
  contact = Contact.create(first_name,last_name,email,phone_number)
  ContactDatabase.write(contact)
  puts "Contact added."
end

def list_all
  contacts = read_csv
  puts contacts
end

def show_contact(keyword)
  contact = read_csv
  puts contact 
end

def find_contact(cli_id)
  contact = read_csv
end


case command
  when "help" then menu
  when "create" then create_contact
  when "list" then list_all
  when "show" then show_contact(0) if cli_id == true
  when "find" then find_contact(cli_id)
  else
    puts "Command not listed, sorry"
end