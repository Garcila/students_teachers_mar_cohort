class Teacher < ActiveRecord::Base

	has_many :students

	validates :email, uniqueness: true

	validate :retirement_after_hire, if: [:hire_date, :retirement_date]
	validate :retirement_date_less_than_today, if: :retirement_date

	after_save :is_retirement_date_set?

	def retirement_after_hire
		if retirement_date < hire_date
			errors.add(:retirement_date, "retirement date has to be after hire date")
		end
	end

	def retirement_date_less_than_today
		if retirement_date < Date.today && hire_date && retirement_date
			errors.add(:retirement_date, "Retirement dates can't be set to future dates")
		end
	end

	def is_retirement_date_set?
		if retirement_date 
			students.teacher_id = nil  #PROBLEM PROBLEM
		end
		students.save
	end
end