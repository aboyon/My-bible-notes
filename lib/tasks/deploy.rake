require 'active_record'
require 'yaml'


namespace :heroku do

	desc "Regenerate configuration files"
	task :reload do
	    puts "Reloading configuration"
	    File.link("#{Rails.root}/config/database.yml.sample", "#{Rails.root}/config/database.yml")
	end

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