class Role < ActiveRecord::Base
	has_many :users

	scope :usuario, -> {find_by(:name=>'Usuario')}
	scope :admin, -> {find_by(:name=>'Administrador')}

end
