json.extract! cliente, :id, :nombre, :rut, :domicilio, :telefono1, :mail, :descripcion, :comuna_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
