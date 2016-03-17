require 'pry'

class Student < ActiveRecord::Base

  belongs_to :teacher

  validates_format_of :email, with: /\S\S\@.*?\..*/
  validates :email, uniqueness: true
	validates :age, numericality: {greater_than: 3}

	def name
		name = first_name + ' ' + last_name
	end  

	def age
		(Date.today - birthday).to_i/365
	end

end
