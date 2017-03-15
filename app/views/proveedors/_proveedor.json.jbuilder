json.extract! proveedor, :id, :nombre, :razon_social, :rut, :domicilio, :telefono1, :telefono2, :web, :mail, :descripcion, :comuna_id, :created_at, :updated_at
json.url proveedor_url(proveedor, format: :json)
