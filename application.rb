command = ARGV[0]
@parameter = ARGV[1]

require './setup'

def help
  puts " "
  puts "Welcome to the app. What's next?"
  puts " new            - Create a new contact"
  puts " list           - List all contacts"
  puts " find (number)  - Display a single contact"
  puts " delete         - Delete a contact"
end

puts "Welcome"
puts "-------"
# Contact.create(firstname: 'Garry',    lastname: 'Hicks', email: 'garryhicks21@gmail.com')
# Contact.create(firstname: 'Candice',  lastname: 'Hicks', email: 'candicehicks@gmail.com')
# Contact.create(firstname: 'Joe',      lastname: 'Shmoe', email: 'joeshmoe@gmail.com')

case command
when 'new'
  puts 'Give me first name'
  first = STDIN.gets.chomp
  puts 'Gimme a last name'
  last = STDIN.gets.chomp
  puts 'You give me email address, now!!!'
  email = STDIN.gets.chomp
  Contact.create(
    firstname: first,
    lastname: last,
    email: email)
  binding.pry
  puts "Contact added"
when 'list'
  a = Contact.select(:id, :firstname, :lastname, :email)
  a.each do |x|
    puts x.id
    puts "#{x.firstname} #{x.lastname}"
    puts x.email
    puts ""
  end
when 'find'
  id = @parameter 
  a = Contact.find(id)
  puts a.id
  puts "#{a.firstname} #{a.lastname}"
  puts a.email
when 'delete'
  id = @parameter
  puts "Contact with details:"
  a = Contact.find(id)
  puts " "
  puts a.id
  puts "#{a.firstname} #{a.lastname}"
  puts a.email
  puts " "
  Contact.destroy(id)
  puts "has been destroyed"
when '--help'
  help
end