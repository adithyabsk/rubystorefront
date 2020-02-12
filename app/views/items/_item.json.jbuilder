json.extract! item, :id, :brand, :name, :restricted, :ageRestricted, :quantity, :cost, :taxSlab, :created_at, :updated_at
json.url item_url(item, format: :json)
