class Proj < ApplicationRecord
	has_many :tasks, dependent: :destroy
accepts_nested_attributes_for :tasks, allow_destroy: true
validates :title, presence: true 
	validates :desc, presence: true 

end
