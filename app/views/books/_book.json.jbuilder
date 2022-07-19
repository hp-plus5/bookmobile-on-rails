json.extract! book, :id, :title, :is_owned?, :created_at, :updated_at
json.url book_url(book, format: :json)
