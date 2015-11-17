json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :appointment_id, :nombre, :tipo, :descripcion, :precio
  json.url procedure_url(procedure, format: :json)
end
