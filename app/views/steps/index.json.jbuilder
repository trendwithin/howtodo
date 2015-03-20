json.array!(@steps) do |step|
  json.extract! step, :id, :step, :theme_id
  json.url step_url(step, format: :json)
end
