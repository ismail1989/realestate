desc "Setup Roles"
task :setup_roles => :environment do
  Role.create(name:"General Manager")
  Role.create(name:"Blog Manager")
  Role.create(name:"Property Manager")
end