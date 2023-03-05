User.delete_all

User.create!(name: "Admin User", email: "admin@example.com", password: "Mysecret+1234",
  password_confirmation: "Mysecret+1234", role: "admin")

User.create!(name: "Customer User", email: "customer@example.com", password: "Mysecret+1234",
  password_confirmation: "Mysecret+1234")

Rails.logger.debug "Seed users complete"
