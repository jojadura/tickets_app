class State < ActiveRecord::Base
	has_many :supports
    validates :order, :name, :color, presence: {message: "Es requerido"}
	scope :abierto, ->{find_by(:name=> Rails.application.secrets.abierto )}
	scope :finalizado, ->{find_by(:name=> Rails.application.secrets.finalizado )}
	scope :pre_finalizado, ->{find_by(:name=> Rails.application.secrets.pre_finalizado )}
	scope :pendiente, ->{find_by(:name=> Rails.application.secrets.pendiente )}
end
