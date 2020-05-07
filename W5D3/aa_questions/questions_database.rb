# TODO Ruby
# Keep a tab open with the sqlite3 gem's documentation. Use these docs to help 
# you figure out what methods are available and how to use them!
# ! http://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database

#? Write a QuestionsDatabase class similar to one created in last night's demo:
#? PlaysDatabase. This class should inherit from SQLite3::Database; you will
#? only need one instance. If you use the Singleton module this will be
#? available through a QuestionsDatabase::instance method.

#* NB: Remember that a singleton is a general programming pattern that
#* describes a scenario in which you will only have a single instance of a
#* particular class. Ruby's Singleton module helps implement this pattern - it
#* ensures that only one instance of that class is ever created
#* (make sure you use the instance method.)

#? The QuestionsDatabase class will handle the connection to the database, but
#? when we query the database, we get back a hash of data. That can be a bit ugly
#? to work with, especially when dealing with multiple tables.

#? What we'll do to make this easier on ourselves is abstract away the
#? communication to each of those tables into objects. We'll create a model class
#? for each table that will represent an item from each of the tables and
#? abstract away the SQL queries. This will give us an object-oriented way to
#? interact with the database.

#* NB: This pattern of abstracting away data storage and manipulation is a
#* common one and an extremely helpful one. We will become much more experienced
#* with this pattern as we transition into Rails.

#? Write one class per table (for the questions table we write a Question class).
#? For each class, add a class method find_by_id which will lookup an id in the
  # table, and return an object representing that row. For example,
  # our Question::find_by_id should return an instance of our Question class
  # NOT the data hash returned by the QuestionsDatabase! Your ::find_by_id
  # method should contain Question.new somewhere.
#? We'll add additional query class methods as needed. For instance, the user
  # class will have User::find_by_name(fname, lname).
#? Your initialize method should take an options hash of attributes and
  # construct an object wrapping that data. We do this because the DB query
  # return value is an array of hashes in exactly this format.
    #* E.g., User.new('fname' => 'Ned', 'lname' => 'Ruggeri', 'is_instructor' => true)
      #* should return a User object with those attributes.
#? Add attribute accessors to access the instance variables of our new classes.
  # These instance variables have now been populated with the data from the database.
    #* E.g., User#fname will return the fname of the user object that was
      #* populated from a row in the users database.
#? Before writing any more code, take some time to make sure what you've done
  # so far works by jumping into pry. Load the files you want to test and call
  # your new methods. Check that your queries return the correct results and
  # that those results are Ruby objects.

require 'sqlite3'
require 'singleton'

class QuestionsDB < SQLite3::Database
  include Singleton

  def initialize
    super("./questions.db")
    self.type_translation = true
    self.results_as_hash = true
  end
end
