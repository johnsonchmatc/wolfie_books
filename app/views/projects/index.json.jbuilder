json.array!(@projects) do |project|
  json.extract! project, :id, :title, :start_date, :end_date, :client_id
  json.client project.client, :id, :name
  json.url project_url(project)
end
