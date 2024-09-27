#----------------1----------------
'''
# Print "Hello, World!" to the console
puts ("Hello, World!")

# Declare a variable `name` and assign your name to it
name = "Athipat Aripai"
puts (name)

# Create a method `greet` that prints "Good morning!" and follow with your name
def greet(name)
    "Good morning! #{name}"
end

puts greet(name)
'''
#----------------2----------------
'''
# Create an array with 5 numbers
n = [1,2,3,4,5]

# Access the second element in the array
puts "Accessting element index 1 is #{N[1]}"
puts

# Add a new number to the end of the array
n.push(6)
puts n
puts

# Find the length of the array
puts "Size of this array is #{N.length}"
puts

# Create a hash with 3 key-value pairs (title, author, pages) representing a book
h = {title:"Hey yo",author:"MiNTo",pages:"20"}

# Access the value for the key :author
puts h[:author]
puts

# Add a new key :published_year with the value 1949
h[:published_year] = 1949
puts h
puts

# Remove the key :pages from the hash
h.delete(:pages)
puts h
puts
'''
#------------------3----------------
'''
number = 10  # You can change this value to test
# Write a program that checks if a number is positive, negative, or zero
if number < 0
    print "Negative\n\n"

elsif number == 0
    print "Zero\n\n"

elsif number > 0
    print "Positive\n\n"

end

# Write a program that checks if a number is even or odd
if number%2 == 0
    print "This number #{number} is even\n\n"

else
    print "This number #{number} is odd\n\n"

end

# Write a while loop that counts from 1 to 10
n = 0
while n < number
    n += 1 
    print "#{n} "
end
puts puts

# Write a while loop to print the first 5 even numbers
c = 0
n = 0
while c < 5
    print "#{n} "
    n += 2
    c += 1
end
puts puts
'''
#------------------4----------------
'''
# Write a method that takes a block and prints "Hello, World!"
def greet
    yield
    puts "Hello, World!"
end

greet {print "Saying: "}
puts

# Write a method that takes a block and prints numbers 1 to 5
# count_numbers { |num| puts num }
def count_numbers
    (1..5).each do |num|
        yield(num)
    end
end

count_numbers { |num| puts num }
puts


# Write a method that uses yield with a block that accepts two parameters
# multiply { |a, b| puts a * b }
def multiply
    yield(2,4)
end
multiply { |a, b| puts a * b }
puts


# Write a method that checks if a block is provided and executes it
# greet # Output: No block given
# greet { puts "Hello, World!" } # Output: Hello, World!
def greet
    if block_given?
        yield
    else
        puts "No block given."
    end
end

greet
greet {puts "Hello, World!"}
puts
'''
#----------------5------------------
# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_reader :name, :email, :password , :message

    def initialize(name,email,password)
        @name = name
        @email = email
        @password = password
    end

    def enter_room(room)
        room.user_enter(self)
    end

    def send_message(room,content)
        room.user_enter(self)
        message = Message.new(self,room,content)
        room.broadcast(self,content)
    end

    def acknowledge_message(sender,content)
        puts "#{@name} ackowledge messange from #{sender.name}: '#{content}'"
    end

end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_reader :name, :description, :users

    def initialize(name,description)
        @name = name
        @description = description
        @users = []
    end

    def user_enter (user)
        unless @users.include?(user)
            @users << user
            puts "#{user.name} entered #{@name}"
        end
    end
    
    def current
        @users.each {|user| puts user.name}
    end

    def broadcast (sender, content)
        @users.each do |user|
            user.acknowledge_message(sender, content) unless user == sender
        end
    end

end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_reader :user, :room, :content

    def initialize(user,room,content)
        @user = user
        @room = room
        @content = content
    end

end

user1 = User.new("MinTo","@mil",123456)
user2 = User.new("Motin","@em",244854)
user3 = User.new("Tinmo","@lime",748596)

jopiter = Room.new("Jupiter","where we fly")

user1.enter_room(jopiter)
user2.enter_room(jopiter)
user3.enter_room(jopiter)

user1.send_message(jopiter,"How r u bro")

# add a method to user so, user can enter to a room
# user.enter_room(room)

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
