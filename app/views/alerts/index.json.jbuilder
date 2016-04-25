json.array!(@alerts) do |alert|
  json.extract! alert, :id, :message, :lifespan_in_hours
  json.url alert_url(alert, format: :json)
end
