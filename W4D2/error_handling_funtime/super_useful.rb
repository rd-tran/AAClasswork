# TODO PHASE 2: Make convert_to_int more flexible
# * Overview
# Sometimes we want to return something from our function, even if the desired
# operation is not possible. This might mean handling potential errors in our
# own code and returning a suitable replacement, such as nil or -1
# (often used when trying to find the index of a particular element).
# 
# * Instructions
# We want our dear user to be able to call convert_to_int with no error being
# raised on invalid input. Update convert_to_int to rescue any errors and return
# nil if our argument cannot be converted.
# 
# If we are handling the error thrown by Integer(arg), which StandardError
# subclass should we be catching? Next, update convert_to_int again to only
# rescue the correct exception type.
# 
# * NB: rescue only rescues StandardError and its subclasses.
# Any other Exception subclass is a system error and implies that something
# rather serious has gone wrong and our code should stop executing.

def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError => e
    puts "#{e}"
    return nil
  end
end

# raise ArgumentError.new "whatever message you want inside this string"

# ? RECAP
# Many times we will want to 'protect' the user from potential errors our code
# might throw. In this case we are protecting our user only from errors we
# expect. It is always wise to raise and rescue more specific errors as the
# errors they raise are more descriptive (helpful with debugging) and it
# prevents the catching of errors that should 'escape' up to the calling
# function (catching Exception will even ignore system errors).


# TODO PHASE 3: Make friendly monster (maybe) let you try again
# * Overview
# Sometimes when an error is thrown we would like to try the failing operation
# again (hopefully with different input :wink:). This is often the case with
# user input and text parsing. Let's try to make friendly monster happy by
# allowing us to retry feeding it a fruit when certain errors are thrown.
#
# * Instructions
# Friendly monster is really friendly and really likes coffee, so he'd like to
# give us another try, but only when we give him "coffee".
#
# First, handle the errors being thrown by #reaction in #feed_me_a_fruit.
#
# Note that #reaction throws errors receiving an argument that is not in FRUITS.
# Next, let's differentiate the errors thrown so our calling function,
# #feed_me_a_fruit can try to feed friendly monster again, but only when they've
# given it coffee.
#
# Now that we have different error types being thrown by #reaction we can do a
# little conditional logic in #feed_me_a_fruit to retry the failing block of
# code again, but only if it is a coffee-related error.

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue StandardError
    retry if maybe_fruit == "coffee"
  end
end

# ? RECAP
# Being able to rescue and retry failing code gives us even more control over
# the flow of our program. Handling different errors separately gives us even
# more control.


# TODO PHASE 4: Ensure BestFriend is a real best friend
# * Overview
# Another use case for raising errors is to enforce correct usage of code.
# For example, if a function requires its arguments to be of certain types in
# order to execute properly, it might be best to check their type before
# executing any logic. This is useful because it allows us to inform the user
# that they are not using our function properly, rather than a runtime error
# being raised which may seem like a bug in our code or be more difficult to debug.
#
# * Instructions
# If we look at user_script.rb, we see that our dear user thinks you can be
# besties if you've known each other less than a year. We do not agree.
# Friendships, like a fine wine, need at least five years to mature.
# Update BestFriend#initialize, in super_useful.rb, to raise a descriptive error
# when yrs_known is less than 5.
#
# Test your code, then assume the role of our dear user and update our call to
# BestFriend#new to create a real friendship (yrs_known>= 5).
#
# Our dear user also thinks it's okay to leave name and fav_pastime empty when
# creating a new instance of BestFriend. But it's not okay.
# It leaves #do_friendstuff and #give_friendship_bracelet sorely lacking.
# Poorly formatted text just makes us seethe with displeasure.
# Update the initialize method to raise descriptive errors when given strings
# of length <= 0.
#
# Test your code, then again assume the role of our dear user and update our
# call to BestFriend#new. 

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise StandardError.new "You haven't been friends long enough" if yrs_known < 5
    raise ArgumentError.new "Wrong argument" if name.length == 0 || fav_pastime.length == 0

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

# ? RECAP
# Raising errors for invalid arguments can ensure that our code is used the way
# we want intend. However, be aware that the types of inputs we can receive are
# numerous. We don't want or need to be checking against every possible type for
# each argument we receive.