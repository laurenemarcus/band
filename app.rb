require("bundler/setup")
Bundler.require(:default)

require('sinatra/reloader')
also_reload('lib/**/*.rb')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get("/") do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:band)
end

post("/bands") do
  band = params.fetch("band")
  @bands = Band.all()
  Band.create({:band => band})
  erb(:band)
end

get("/bands/:id") do
  @band = Band.find(params.fetch("id").to_i())
  @venues = Venue.all()
  erb(:band_info)
end
