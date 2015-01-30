require("bundler/setup")
Bundler.require(:default)

require('sinatra/reloader')
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}
