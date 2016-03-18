require 'pry'

class Student < ActiveRecord::Base

  belongs_to :teacher

  validates_format_of :email, with: /\S\S\@.*?\..*/
  validates :email, uniqueness: true
	validates :age, numericality: {greater_than: 3}

	after_save :last_student_added_at, if: :teacher

	def name
		name = first_name + ' ' + last_name
	end  

	def age
		(Date.today - birthday).to_i/365
	end

	def last_student_added_at
		teacher.last_student_added_at = Date.today
		teacher.save
	end
end
