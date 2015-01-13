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
  # puts " important               - Display your most important numbers"
  puts " delete (<number here>)  - Delete a contact"
  puts " "
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
  puts "Please rate the level of importance of this contact, from 1 to 5,"
  puts "(for example, your spouse would be a 5, that nasal guy from the"
  puts "PAC, would be like a 1)"
  importance = STDIN.gets.chomp.to_i
  contact = Contact.create(first_name,last_name,email,phone_number,importance)
  ContactDatabase.write(contact)
  puts "Contact added."
end

def list_all
  contacts = CSV.read('contacts.csv')
  puts contacts
end

def find_contact(id)
  # 
end

def delete
  # list = CSV.read('contacts.csv')
  # puts list
  # puts "Which contact would you like to delete?"  
  # name = gets.chomp
  # Contact.delete(name)
  # newlist = CSV.read('contacts.csv')
  # puts newlist
end

def important
  puts "Here are your contacts marked with an importance"
  puts "of 3 or higher"
  list = Contact.where(importance: [3..5])
  puts list
end

def edit(name, email, phone_number, importance)
  # @first_name = name.split(" ")[0]
  # @last_name = name.split(" ")[1]
  # @email = email if email.present?
  # @phone_number = phone_number
  # @importance = importance
end

case command
  when "help" then menu
  when "create" then create_contact
  when "list" then list_all
  # when "important" then important
  when "show" then find_contact[0] if cli_id == true
  when "delete" then delete_contact[0]
  else
    puts "Command not listed, sorry"
end