json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :start_date, :end_date, :client_id
  json.url project_url(project, format: :json)
end
