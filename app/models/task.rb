class Task < ApplicationRecord
 	 belongs_to :proj, required: false, optional: true
	validates :title, presence: true 
	validates :desc, presence: true 
	validates :duration, presence: true 
	
end
