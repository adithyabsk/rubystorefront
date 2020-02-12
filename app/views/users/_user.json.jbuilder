json.extract! user, :id, :name, :email, :password, :phoneNumber, :dateOfBirth, :addressL1, :addressL2, :adressL3, :cardName, :cardNum, :cardExpire, :cardCCV, :isAdmin, :hasSecurePassword, :created_at, :updated_at
json.url user_url(user, format: :json)
