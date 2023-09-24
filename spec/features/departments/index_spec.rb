require 'rails_helper'

RSpec.describe "Department Index" do
    it "show the department name and floor and you can see the names of all its employees" do
      department1 = Department.create(name: 'IT', floor: 'Basement')
      department2 = Department.create(name: 'HR', floor: '3rd Floor')

      department1.employees.create(name: 'John Doe', level: 2)
      department1.employees.create(name: 'Jane Smith', level: 3)

      department2.employees.create(name: 'Alice Johnson', level: 1)
      department2.employees.create(name: 'Bob Williams', level: 2)

      visit departments_path

      expect(page).to have_content('Departments')
      expect(page).to have_content('IT')
      expect(page).to have_content('Basement')
      expect(page).to have_content('HR')
      expect(page).to have_content('3rd Floor')
      expect(page).to have_content('John Doe')
      expect(page).to have_content('Jane Smith')
      expect(page).to have_content('Alice Johnson')
      expect(page).to have_content('Bob Williams')
    end
end