class EmployeesController < ApplicationController
    def show
        @employee = Employee.find(params[:id])
        @tickets = @employee.tickets_oldest_to_newest
    end
end