class Patient < ActiveRecord::Base

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