require 'rails/generators/active_record'

# Generates the migrations necessary for APN on Rails.
# This should be run upon install and upgrade of the 
# APN on Rails gem.
# 
#   $ rails g apn_migrations

class ApnMigrationsGenerator < Rails::Generators::Base
  argument :name, :default => "migration"
  @timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
  include Rails::Generators::Migration
  
  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end
  
  def self.next_migration_number(dirname)
    @timestamp = @timestamp.succ
    @timestamp
  end
  
  def create_migrations
    migration_template '001_create_apn_devices.rb', 'db/migrate/create_apn_devices.rb'
    migration_template '002_create_apn_notifications.rb', 'db/migrate/create_apn_notifications.rb'
    migration_template '003_alter_apn_devices.rb', 'db/migrate/alter_apn_devices.rb'
  end
  
end