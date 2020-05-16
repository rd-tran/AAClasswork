# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all

cat1 = Cat.create!(birth_date: '2020/05/15', name: 'Cat', color: 'Orange', sex: 'M', description: 'Just a regular cat')
cat2 = Cat.create!(birth_date: '2020/05/15', name: 'Bob', color: 'White', sex: 'M', description: "I'm a builder")
cat3 = Cat.create!(birth_date: '2020/05/15', name: 'Freya', color: 'Orange', sex: 'F', description: 'Thunder cat')
cat4 = Cat.create!(birth_date: '2020/05/15', name: 'Doggo', color: 'White', sex: 'M', description: "I'm actually a dog")
cat5 = Cat.create!(birth_date: '2020/05/15', name: 'Candy', color: 'Black', sex: 'F', description: 'Mmm candy')
cat6 = Cat.create!(birth_date: '2020/05/15', name: 'Soda', color: 'Black', sex: 'F', description: 'Soda is bad for you, but so good')
cat7 = Cat.create!(birth_date: '2020/05/15', name: 'Buttercup', color: 'Orange', sex: 'F', description: "I'm cute")
cat8 = Cat.create!(birth_date: '2020/05/15', name: 'Super_Cat', color: 'White', sex: 'M', description: 'Super')
cat9 = Cat.create!(birth_date: '2020/05/15', name: 'Dom', color: 'Orange', sex: 'M', description: 'Hello there')
cat10 = Cat.create!(birth_date: '2020/05/15', name: 'Naveen', color: 'Brown', sex: 'M', description: 'I am an Indian Cat')
cat11 = Cat.create!(birth_date: '2020/05/15', name: 'Dell', color: 'Orange', sex: 'M', description: 'I am actually Bob')
cat12 = Cat.create!(birth_date: '2020/05/15', name: 'Anne', color: 'Red', sex: 'F', description: 'I like chezeburgers')
cat13 = Cat.create!(birth_date: '2020/05/15', name: 'Maria', color: 'White', sex: 'F', description: 'Banana')
cat14 = Cat.create!(birth_date: '2020/05/15', name: 'David', color: 'Black', sex: 'M', description: 'Poop')

