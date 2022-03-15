json.extract! transaction, :id, :Name, :Amount, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
