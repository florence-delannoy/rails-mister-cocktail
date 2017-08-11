class Ingredient < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	before_destroy :check_for_doses

	has_many :doses

private

	def check_for_doses
	  if doses.count > 0
	    errors.add_to_base("cannot delete ingredient while dose exist")
	    return false
	  end
	end
	
end
