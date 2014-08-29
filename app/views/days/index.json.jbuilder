json.array!(@days) do |day|
  json.extract! day, :id, :date, :title, :status, :note
  json.url day_url(day, format: :json)
end
