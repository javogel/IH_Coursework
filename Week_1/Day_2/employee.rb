class Employee

	attr_reader :name, :email

	def initialize (name, email)
		@name = name
		@email = email
	end

end

class HourlyEmployee < Employee
	def initialize (name, email,rate, hour)
		super(name, email)
		@rate = rate
		@hour = hour
	end

	def calculate_salary
		salary = @rate * @hour
		return salary
	end
end

class SalariedEmployee < Employee
	
	def initialize (name, email, base_salary)
		super(name,email)
		@base_salary = base_salary
	end

	def calculate_salary
		salary = @base_salary / 56
		return salary
	end

end

class MultiPaymentEmployee < Employee
	
	def initialize (name, email, base_salary, overtime_rate, overtime_hours)
		super(name,email)
		@base_salary = base_salary
		@overtime_rate = overtime_rate
		@overtime_hours = overtime_hours
	end

	def calculate_salary
		normal_hours = 40
		if @overtime_hours > normal_hours
			salary = (@base_salary/52) + (@overtime_rate * (@overtime_hours - normal_hours))
			return salary
		else
			salary = @base_salary / 52
			return salary
		end
	end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
stephen = MultiPaymentEmployee.new('Stephen', 'fortranr0x@gmail.com', 80000, 275, 55)
johannus = MultiPaymentEmployee.new('Johannus', 'fortranr0x@gmail.com', 75000, 275, 155)


# josh.calculate_salary
# nizar.calculate_salary
# ted.calculate_salary

class Payroll
  def initialize(employees)
  	@employees = employees
  end


  def notify_employee(employee)
  	 puts "Hi #{employee.name}, you have been paid a salary of #{employee.calculate_salary - (employee.calculate_salary*0.18)}"
  end

  def pay_employees
  	@employees.each do |x|
  		netsalary = x.calculate_salary - (x.calculate_salary*0.18)
  		puts "#{x.name} => #{netsalary}"
  	end
  end

end



employees = [josh, nizar, ted, stephen, johannus]
payroll = Payroll.new(employees)
payroll.pay_employees

puts "/n"
payroll.notify_employee(stephen)
payroll.notify_employee(johannus)