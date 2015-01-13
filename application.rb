class Application

  def run
    show_main
  end

  def show_main
    puts " "
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " show     - Display a single contact"
    puts " important - Display your most important numbers"
    puts " delete   - Delete a contact"
    puts " quit     - Leave this app"
    puts " "
    print "> "
    menu_choice = gets.chomp.downcase
    if menu_choice == "quit"
      puts "Thanks for coming!"
    elsif menu_choice == "new"
      puts "Please enter the first name:"
      first_name = gets.chomp
      puts "Please enter the last name:"
      last_name = gets.chomp
      puts "Please enter the email address, if you have one:"
      email = gets.chomp
      puts "Please enter the phone number of your contact, eg 888-888-8888"
      mobile_phone = gets.chomp
      puts "Please rate the level of importance of this contact, from 1 to 5,"
      puts "(for example, your spouse would be a 5, that nasal guy from the"
      puts "PAC, would be like a 1)"
      importance = gets.chomp.to_i
      contact = Contact.create(
        first_name,
        last_name,
        email,
        mobile_phone,
        importance
        )
      CSV.open("contacts.csv", 'a') do |new_contact|
        new_contact << ["#{first_name}", "#{last_name}", "#{email}", "#{mobile_phone}", "#{importance}"]
      end
      puts "Contact added."
    elsif menu_choice == "list"
      contacts = CSV.read('contacts.csv')
      puts contacts
    elsif menu_choice == "show"
      puts "Which contact name would you like to display more information on?"
      puts "First name only please"
      name = gets.chomp
      contact = Contact.find(first_name)
      puts contact
    elsif menu_choice == "delete"
      list = Contact.all
      puts list
      puts "Which contact would you like to delete?"
      name = gets.chomp.to_i
      Contact.delete(name)
      newlist = Contact.all
      puts newlist
    elsif menu_choice == "important"
      puts "Here are your contacts marked with an importance"
      puts "of 3 or higher"
      list = Contact.where(importance: [3..5])
      puts list
    end

    def edit(name, email, mobile_phone)
      @first_name = name.split(" ")[0]
      @last_name = name.split(" ")[1]
      @email = email if email.present?
    end
  end
end      