json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :description, :project_id
  json.url profile_url(profile, format: :json)
end
