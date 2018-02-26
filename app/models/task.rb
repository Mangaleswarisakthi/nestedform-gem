class Task < ApplicationRecord
 	 belongs_to :proj, required: false, optional: true
end
