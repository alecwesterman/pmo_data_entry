json.array!(@tqa_categories) do |tqa_category|
  json.extract! tqa_category, :id, :name
  json.url tqa_category_url(tqa_category, format: :json)
end
