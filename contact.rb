require'pg'

class Contact
  
  attr_reader   :id 
  attr_accessor :firstname,
                :lastname,
                :email,
                :mobile_phone
 
  def initialize(firstname, lastname, email, mobile_phone, id=nil)
    @firstname =    firstname
    @lastname =     lastname
    @email =        email
    @mobile_phone = mobile_phone
    @id =           id
  end

  def save
    contacts = []
    if id.nil?
      sql = "INSERT INTO contacts (firstname, lastname, email, mobile_phone) VALUES ($1, $2, $3, $4);"
      params = [firstname, lastname, email, mobile_phone]
    else
      sql = "UPDATE contacts set firstname=$1, lastname=$2, email=$3, mobile_phone=$4, id=$5 WHERE id=$5"
      params = [firstname, lastname, email, mobile_phone, id]
    end
    Contact.connection.exec_params(sql, params)

    contacts << Contact.new(row['firstname'],
      row['lastname'],
      row['email'],
      row['mobile_phone'],
      row['id'])

    self.class.connection.exec_params(sql, [firstname,lastname,email,mobile_phone,id])
    true
  rescue
    false
  end

  class << self

    def connection
      @@connection = PG.connect(dbname: 'dcakv6hbhrelqh',
        port: 5432,
        host: 'ec2-54-83-204-104.compute-1.amazonaws.com',
        user: 'awqnzeamhulegr',
        password: '9s-9ahNRexGu1qT3oTYLYoQJ-l')
    end

    def all
      contacts = []
      connection.exec("SELECT * FROM contacts") do |rows|
        rows.each do |row|
          contacts << Contact.new(row['firstname'],
            row['lastname'],
            row['email'],
            row['mobile_phone'],
            row['id']
          )
        end
      end
      contacts
    end
    
    def find(id)

      contact = nil #store a found contact

      sql = "SELECT firstname, lastname, email, mobile_phone, id FROM contacts WHERE id=$1"
      params = [id]
      Contact.connection.exec_params(sql, params) do |rows|
          rows.each do |row|
            contact = Contact.new(row['firstname'],
            row['lastname'],
            row['email'],
            row['mobile_phone'],
            row['id']
            )

          end
        end
        contact
      end

      def destroy(id)
        sql = "DELETE FROM contacts WHERE id=$1"
        params = [id]
        Contact.connection.exec_params(sql,params)
      end

    # def show(id)
    #   contacts = ContactDatabase.read_from_csv
    #   contacts.each do |contact|
    #     if contact.last == id
    #       return contact
    #     end
    #   end
    # end
  end
end


