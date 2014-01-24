json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :published_at
  json.url book_url(book, format: :json)
end
