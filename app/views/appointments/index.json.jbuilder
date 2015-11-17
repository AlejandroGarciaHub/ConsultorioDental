json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :motivo,:anotaciones, :patient_nombre
  json.title appointment.patient_nombre
  json.start appointment.fecha
  json.end appointment.fecha+30.minutes
  json.url appointment_url(appointment, format: :html)
end
