class Appointment < ActiveRecord::Base
	validates :patient_id, presence: true
	validates :patient_nombre, presence: true
	validates_datetime :fecha, :after => :now
	validates :motivo, presence: true

	belongs_to :patient

	has_many :procedures, :dependent => :destroy

	def patient_nombre
		patient.try(:nombre_completo)
	end

	def patient_nombre=(nombre)
		self.patient=Patient.find_or_create_by_nombre(nombre) if nombre.present?
	end
end
