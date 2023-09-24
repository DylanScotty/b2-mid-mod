class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def tickets_oldest_to_newest
    self.tickets.order(age: :desc)
  end

  def oldest_ticket
    self.tickets_oldest_to_newest.first
  end
end