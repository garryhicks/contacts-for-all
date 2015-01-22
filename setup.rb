require 'pry'
require 'active_record'
require_relative 'lib/contact'
require_relative 'lib/phone_nums'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: '',
  username: '',
  password: '',
  host: '',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"
puts "Setting up Database (recreating tables)..."

ActiveRecord::Schema.define do
  # drop_table :phone_nums if ActiveRecord::Base.connection.table_exists?(:phone_nums)
  # drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  # create_table :contacts do |t|
  #   t.column :firstname, :string
  #   t.column :lastname, :string
  #   t.column :email, :string
  # end
  # create_table :phone_nums do |t|
  #   t.references :contacts
  #   t.column :phone, :string
  #   t.column :contact_id, :integer
  #   t.timestamps
  # end
end
puts "SETUP COMPLETE."