require 'byebug'
class Employee
  attr_reader :salary

  # def inspect
  #   p "Name = #{@name}"
  # end

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee 
  attr_reader :reports, :name
  # def inspect
  #   super
  # end

  def initialize(name, title, salary, boss, reports)
    super(name, title, salary, boss)
    @reports = reports
  end

  def reports_salary
    total_salary = 0
    queue = [self]

    until queue.empty?
      # debugger
      employee = queue.shift
      if employee.is_a?(Manager)
        employee.reports.each do |report|
          total_salary += report.salary
        end
        queue += employee.reports 
      end
    end

    total_salary
  end

  def bonus(multiplier)
    reports_salary * multiplier
  end


end

shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
david = Employee.new('David', 'TA', 10000, 'Darren')
darren = Manager.new('Darren', 'TA Manager', 78000, 'Ned', [shawna, david])
ned = Manager.new('Ned', 'Founder', 1000000, nil, [darren])

p ned.bonus(5)