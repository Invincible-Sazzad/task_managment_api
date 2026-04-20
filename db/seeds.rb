# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
User.find_or_create_by!(email: "test@example.com") do |user|
  user.password = "password123"
end

10.times do |i|
  Task.find_or_create_by!(title: "Sample Task #{i + 1}") do |task|
    task.description = "Description for Sample Task #{i + 1}"
    task.user = User.first
    task.status = "pending"
    task.due_date = Date.today + (i + 1).days
  end
end
