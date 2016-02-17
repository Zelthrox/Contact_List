require 'csv'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email, :id

  CONTACTS_DATABASE = "contacts.csv"

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      puts "\nDisplaying all contacts in the list:"
      CSV.foreach(CONTACTS_DATABASE) do |row|
        p row
      end

    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      id = CSV.foreach(CONTACTS_DATABASE).count + 1
      CSV.open(CONTACTS_DATABASE, "a") do |csv|
        csv << [id, name, email]
      end

    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach(CONTACTS_DATABASE) do |row|
        p row if row[0] == id
      end
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
      CSV.foreach(CONTACTS_DATABASE) do |row|
        p row if (row[0] == term || row[1] == term || row[2] == term)
      end
    end

  end

end
