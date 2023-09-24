class DepartmentsController < ApplicationController
    def index
        @departments = Department.includes(:employees)
    end
end