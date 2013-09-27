json.array!(@patterns) do |pattern|
  json.extract! pattern, :content, :guess_state
  json.url pattern_url(pattern, format: :json)
end
