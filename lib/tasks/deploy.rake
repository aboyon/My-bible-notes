require 'active_record'
require 'yaml'


namespace :heroku do

	desc "Migrate databases in heroku"
	task :migrate do
	    puts "migrating database..."
	    puts "Base directory: #{Rails.root}"
	    databases = YAML.load_file("#{Rails.root}/config/database.yml")
		ActiveRecord::Base.establish_connection(databases['production'])
		ActiveRecord::Migration.verbose = true
		ActiveRecord::Migrator.migrate("db/migrate")
	end
end