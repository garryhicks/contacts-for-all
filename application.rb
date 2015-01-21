require 'pg'
require 'byebug'
require_relative './contact'

conn = PG.connect(dbname: 'dcakv6hbhrelqh',
        port: 5432,
        host: 'ec2-54-83-204-104.compute-1.amazonaws.com',
        user: 'awqnzeamhulegr',
        password: '9s-9ahNRexGu1qT3oTYLYoQJ-l')

# c = Contact.new("john","chan","jc@gmail.com","123-456-2123")
contact = Contact.destroy(5)
byebug
puts contact


# conn.exec("SELECT * FROM contacts") do |rows|
#   rows.each do |row|
#     puts row
#   end
# end