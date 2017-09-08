desc "Setup Users"
task :setup_users => :environment do
  User.create(email: 'gen_manager@ora.com', password: 'password', password_confirmation: 'password', role_id: Role.find_by_name('General Manager').id)
  User.create(email: 'blog_manager@ora.com', password: 'password', password_confirmation: 'password', role_id: Role.find_by_name('Blog Manager').id)
  User.create(email: 'pro_manager@ora.com', password: 'password', password_confirmation: 'password', role_id: Role.find_by_name('Property Manager').id)
end