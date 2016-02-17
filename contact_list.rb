require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

  if ARGV[0] == 'list'
    Contact.all
  elsif ARGV[0] == 'new'
    puts "What is the contact's full name?"
    fullname = $stdin.gets.chomp
    puts "What is the contact's email?"
    email = $stdin.gets.chomp
    Contact.create(fullname, email)
  elsif ARGV[0] == 'show'
    Contact.find(ARGV[1])
  elsif ARGV[0] == 'search'
    Contact.search(ARGV[1])
  else
    puts "\n Here is a list of available commands: \n
          new    - Create a new contact \n
          list   - List all contacts \n
          show   - Show a contact \n
          search - Search contacts \n \n"
  end

end
