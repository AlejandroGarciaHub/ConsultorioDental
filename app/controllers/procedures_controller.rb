class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]
  before_action :set_appointment, only: [:show,:edit,:new,:create,:update,:destroy]
  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = Procedure.where(appointment_id: params[:appointment_id])
  end

  def list
    @procedures=Procedure.all
    @appointments=Appointment.all
  end
  # GET /procedures/1
  # GET /procedures/1.json
  def show
    @appointment=Appointment.find(params[:appointment_id])
  end

  # GET /procedures/new
  def new
    @appointment=Appointment.find(params[:appointment_id])
    @procedure = Procedure.new
  end

  # GET /procedures/1/edit
  def edit
    @appointment=Appointment.find(params[:appointment_id])
  end

  # POST /procedures
  # POST /procedures.json
  def create
    @appointment=Appointment.find(params[:appointment_id])
    @procedure = Procedure.new(procedure_params)
    @procedure.appointment=@appointment
    respond_to do |format|
      if @procedure.save
        format.html { redirect_to appointment_procedure_path(@appointment,@procedure), notice: 'Procedure was successfully created.' }
        format.json { render :show, status: :created, location: @procedure }
      else
        format.html { render :new }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  def update
    @appointment=Appointment.find(params[:appointment_id])
    @procedure = Procedure.new(procedure_params)
      respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to appointment_procedure_path(@appointment,@procedure), notice: 'Procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @procedure }
      else
        format.html { render :edit }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to appointment_procedures_path(@appointment,@procedure), notice: 'Procedure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment=Appointment.find(params[:appointment_id])      
    end
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procedure_params
      params.require(:procedure).permit(:nombre, :tipo, :descripcion, :precio,:appointment_id)
    end
end
