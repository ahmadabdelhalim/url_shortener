require 'rails/generators'
require 'rails/generators/migration'

class UrlShortenerGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  source_root File.expand_path('templates', __dir__)

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_shortened_urls.rb'
  end
end