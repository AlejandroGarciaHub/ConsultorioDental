class Procedure < ActiveRecord::Base
	
	belongs_to :appointment

	def precio_pesos
		"$ #{self.precio}"
	end

end
