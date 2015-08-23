json.array!(@criterions) do |criterion|
  json.extract! criterion, :id, :name, :weigth, :preference, :indifference, :veto, :direction, :project_id
  json.url criterion_url(criterion, format: :json)
end
