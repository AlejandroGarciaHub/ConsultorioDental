class Procedure < ActiveRecord::Base
	
	validates :descripcion, presence: true, length: { minimum: 15, message: "es muy corto, minimo deben ser 15 caracteres"}
	validates :precio, presence: true

	ATTR_NAMES = {:descripcion => "El campo descripción", :precio=> "El campo precio"}
	  def self.human_attribute_name(attr, options={})
     ATTR_NAMES[attr.to_sym] || super
	  end

	belongs_to :appointment

	def precio_pesos
		"$ #{self.precio}"
	end

end
