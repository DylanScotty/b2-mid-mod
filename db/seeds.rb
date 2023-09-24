# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department1 = Department.create(name: 'IT', floor: 'Basement')
department2 = Department.create(name: 'HR', floor: '3rd Floor')

department1.employees.create(name: 'John Doe', level: 2)
department1.employees.create(name: 'Jane Smith', level: 3)

department2.employees.create(name: 'Alice Johnson', level: 1)
department2.employees.create(name: 'Bob Williams', level: 2)