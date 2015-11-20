class PatientsController < ApplicationController
	before_action :authenticate_user!

	def index
		@patients= Patient.all
	end	
	def show
		@patient=Patient.find(params[:id])
        @appointments=Appointment.where(patient_id: params[:id])
	end
	def new
		@patient=Patient.new
	end

	def edit
		@patient=Patient.find(params[:id])
	end

	def create
		@patient=current_user.patients.new(patient_params)
		if @patient.save
			redirect_to @patient
		else
			render :new
		end
	end

	def destroy
		@patient=Patient.find(params[:id])
		@patient.destroy
		redirect_to patients_path
	end
	def update
		@patient=Patient.find(params[:id])
		if @patient.update(patient_params)
			redirect_to @patient
		else
			render :edit
		end
	end

	private
	def patient_params
		params.require(:patient).permit(:photo,:nombre,:aPaterno,:aMaterno,:fechaNac,:sexo,:domicilioCalle,:domicilioCiudad,:telefono, :bajoTMedico,:tomaActualMedicamento,:medicamentoTomado,:sangraExcesivo,:esVIH,:estaEmbarazada,:esAlergico,:medicamentoAlergia,:tipoSangre,:user_id)
	end
end