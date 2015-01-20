json.array!(@tqa_aspects) do |tqa_aspect|
  json.extract! tqa_aspect, :id, :name, :percent_run, :percent_pass
  json.url tqa_aspect_url(tqa_aspect, format: :json)
end
