require 'rails_helper'

RSpec.describe "employee show page" do
    it "it shows the employee name and their department and a list of all their ticketsfrom oldest to newest" do
        department = Department.create(name: 'IT', floor: 'Basement')
        employee = department.employees.create(name: 'John Doe', level: 2)
        
        ticket1 = Ticket.create(subject: 'Ticket 1', age: 5)
        ticket2 = Ticket.create(subject: 'Ticket 2', age: 10)

        EmployeeTicket.create(employee: employee, ticket: ticket1)
        EmployeeTicket.create(employee: employee, ticket: ticket2)

        visit "/employees/#{employee.id}"

        expect(page).to have_content('Employee Details')
        expect(page).to have_content("Name: #{employee.name}")
        expect(page).to have_content("Department: #{department.name} (#{department.floor})")

        save_and_open_page

        within("div.oldest-ticket") do
        expect(page).to have_content("Ticket 2")
        end
    end

    describe "ticket form" do

        it 'does not list tickets not assigned to the employee' do
            department = Department.create(name: 'IT', floor: 'Basement')
            employee = department.employees.create(name: 'John Doe', level: 2)
        
            ticket1 = Ticket.create(subject: 'Ticket 1', age: 5)
            ticket2 = Ticket.create(subject: 'Ticket 2', age: 10)

            visit "/employees/#{employee.id}"

            expect(page).not_to have_content('Ticket not assigned to this employee')
        end

        it 'displays a form to add a ticket to the employee' do
            department = Department.create(name: 'IT', floor: 'Basement')
            employee = department.employees.create(name: 'John Doe', level: 2)
        
            ticket1 = Ticket.create(subject: 'Ticket 1', age: 5)
            ticket2 = Ticket.create(subject: 'Ticket 2', age: 10)

            visit "/employees/#{employee.id}"

            expect(current_path).to eq("/employees/#{employee.id}")

            expect(page).to have_selector('form', count: 1)
            expect(page).to have_field('Ticket ID')
            expect(page).to have_button('Add Ticket')
        end

        it 'adds a ticket to the employee and displays the ticket' do
            department = Department.create(name: 'IT', floor: 'Basement')
            employee = department.employees.create(name: 'John Doe', level: 2)
          
            ticket1 = Ticket.create(subject: 'Ticket 1', age: 5)
            ticket2 = Ticket.create(subject: 'Ticket 2', age: 10)
          
            visit "/employees/#{employee.id}"
          
            fill_in 'Ticket ID', with: ticket2.id
            click_button 'Add Ticket'
          
            expect(current_path).to eq("/employees/#{employee.id}")
          
            expect(page).to have_content('Ticket 2')
        end
    end
end