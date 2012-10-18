#loading custom gems
require 'json'
require 'xmlsimple'
require 'typhoeus'

# getting configuration file
APP_CONFIG = YAML.load(ERB.new(File.read("#{Rails.root}/config/config.yml")).result)[Rails.env]