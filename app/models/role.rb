class Role < ActiveRecord::Base
	has_many :users

	scope :usuario, -> {find_by(:name=>'Usuario')}
end
