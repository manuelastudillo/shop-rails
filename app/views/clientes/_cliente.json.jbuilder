json.extract! cliente, :id, :name, :last_name, :rut, :fono, :email, :comuna_id, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
