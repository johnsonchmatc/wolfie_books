json.array!(@clients) do |client|
  json.extract! client, :id, :name, :contact_name, :phone, :contact_email, :street, :city, :state, :postal_code
  json.url client_url(client, format: :json)
end
