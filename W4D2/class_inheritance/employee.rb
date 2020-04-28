# TODO Class Inheritance
# This mini-project will apply the skills you learned in last night's
# inheritance reading.

# TODO Learning Goals
# Understand how a subclass inherits from a superclass
# Know how to override a parent class's method
# Know when and how to use super

# TODO Employee and Manager
# Write a class Employee that has attributes that return the employee's name,
# title, salary, and boss.
#
# Write another class, Manager, that extends Employee. Manager should have an
# attribute that holds an array of all employees assigned to the manager.
# Note that managers might report to higher level managers, of course.
#
# Add a method, bonus(multiplier) to Employee. Non-manager employees should get
# a bonus like this
  # ! bonus = (employee salary) * multiplier
#
# Managers should get a bonus based on the total salary of all of their
# subordinates, as well as the manager's subordinates' subordinates, and the
# subordinates' subordinates' subordinates, etc.
  # ! bonus = (total salary of all sub-employees) * multiplier

class Employee
  attr_reader :name, :title, :salary, :employees
  attr_accessor :boss

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
    @employees = []
  end

  def bonus(multiplier)
    salary * multiplier
  end

  def add_boss(new_boss)
    self.boss = new_boss 
    new_boss.employees << self
  end

end

class Manager < Employee
  def initialize(name, title, salary)
    super
  end

  def bonus(multiplier)
    queue = [self]
    sum = 0

    until queue.empty?
      worker = queue.shift
      underlings = worker.employees
      sum += underlings.map(&:salary).sum
      queue += underlings
    end

    sum * multiplier
  end
end

# * Testing
# If we have a company structured like this: 
  # ! Name	  Salary	    Title	    Boss
  #   Ned	    \$1,000,000	Founder	    nil
  #   Darren  \$78,000	  TA Manager	Ned
  #   Shawna  \$12,000	  TA	        Darren
  #   David	  \$10,000	  TA	        Darren
# then we should have bonuses like this:
  # ! ned.bonus(5) # => 500_000
  # ! darren.bonus(4) # => 88_000
  # ! david.bonus(3) # => 30_000

  if $PROGRAM_NAME == __FILE__
    shawna = Employee.new("Shawna", "TA", 12000)
    david = Employee.new("David", "TA", 10000)
    ned = Manager.new("Ned", "Founder", 1000000) 
    darren = Manager.new("Darren", "TA Manager", 78000)

    shawna.add_boss(darren)
    david.add_boss(darren)
    darren.add_boss(ned)

    puts ned.bonus(5) # => 500_000
    puts darren.bonus(4) # => 88_000
    puts david.bonus(3) # => 30_000
  end
