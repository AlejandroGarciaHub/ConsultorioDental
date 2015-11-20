class Patient < ActiveRecord::Base

	validates :nombre, presence: true, length: { minimum: 3, message: "es muy corto" }
	validates :aPaterno, presence: true, length: { minimum: 3, message: "es muy corto" }
	validates :aMaterno, presence: true, length: { minimum: 3, message: "es muy corto" }
	validates_datetime :fechaNac, presence: true, :before => :now
	validates :domicilioCalle, presence: true, length: { minimum: 10, message: "es muy corto" }
	validates :domicilioCiudad, presence: true, length: { minimum: 10, message: "es muy corto" }
	validates :telefono, presence: true, length: { minimum: 7, message: "es muy corto" }


	ATTR_NAMES = {:nombre => "El campo nombre", :aPaterno=> "El campo apellido paterno", :aMaterno=>"El campo apellido materno",
					:domicilioCalle=>"El campo direccion", :domicilioCiudad=>"El campo ciudad",:telefono=>"El campo numero de telefono"}
	  def self.human_attribute_name(attr, options={})
     ATTR_NAMES[attr.to_sym] || super
	  end

 	belongs_to :user
	has_many :appointments, :dependent => :destroy

	has_attached_file :photo, styles: {medium: "300x300", thumb: "140x140>"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

	def calcula_edad
		((Date.today - self.fechaNac) / 365).floor
	end
	def nombre_completo
		"#{self.nombre} #{self.aPaterno} #{self.aMaterno}"
	end
	def nombre_busqueda
		"[#{self.id}] #{self.nombre} #{self.aPaterno} #{self.aMaterno}"
	end
end