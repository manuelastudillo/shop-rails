json.extract! item, :id, :codigo, :descripcion, :brand_id, :unit_id, :category_id, :stock, :min_stock, :precio, :proveedor_id, :created_at, :updated_at
json.url item_url(item, format: :json)
