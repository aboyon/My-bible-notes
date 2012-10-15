require 'active_record'
require 'yaml'

desc "Deploy in heroku"
task :heroku do
    puts "migrating database..."
    databases = YAML.load_file("../../config/database.yml")
	ActiveRecord::Base.establish_connection(databases['production'])
	ActiveRecord::Migration.verbose = true
	ActiveRecord::Migrator.migrate("db/migrate")
end