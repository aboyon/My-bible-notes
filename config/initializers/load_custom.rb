#loading custom gems
require 'json'
require 'xmlsimple'
require 'typhoeus'

# getting configuration file
APP_CONFIG = YAML.load_file("#{Rails.root.join('app').to_s}/config/config.yml")[ENV["RAILS_ENV"]]