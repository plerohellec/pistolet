require 'yaml'
require 'pp'

configure :production, :development do
  include ActiveRecord::Tasks
  DatabaseTasks.db_dir = 'db'

  db_config_path = File.dirname(__FILE__), '..', 'config/database.yml'
  DatabaseTasks.database_configuration = YAML.load_file File.join(db_config_path)

  db = DatabaseTasks.database_configuration['development']
  ActiveRecord::Base.establish_connection(
    :adapter => db['adapter'],
    :host    => db['host'],
    :username => db['username'],
    :password => db['password'],
    :database => db['database'],
    :encoding => 'utf8'
    )
end
