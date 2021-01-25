json.extract! expense, :id, :expense_type, :description, :amount, :owner, :created_at, :updated_at
json.url expense_url(expense, format: :json)
