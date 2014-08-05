User.create!(email: 'test@example.com', password: 'password',
             password_confirmation: 'password', first_name: 'Test',
             last_name: 'User', role: 'staff')

User.create!(email: 'admin@example.com', password: 'password',
             password_confirmation: 'password', first_name: 'Admin',
             last_name: 'User', role: 'admin')
