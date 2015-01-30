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

post('/bands') do
  band = params.fetch("band")
  Band.create({:band => band})
  @bands = Band.all()
  erb(:band)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venue)
end

post("/venues") do
  venue = params.fetch("venue")
  Venue.create({:venue => venue})
  @venues = Venue.all()
  erb(:venue)
end

get("/bands/:id") do
  @venues = Venue.all()
  @band = Band.find(params.fetch("id").to_i())
  erb(:band_info)
end

patch("/bands/:id") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  venue_ids = params.fetch("venue_ids") + @band.venue_ids
  @band.update({:venue_ids => venue_ids})
  @venues = Venue.all()
  erb(:band_info)
end

patch("/bands/:id/edit") do
  band_id = params.fetch("id").to_i()
  band = params.fetch("band")
  @band = Band.find(band_id)
  @band.update({:band => band})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:band_info)
end

delete("/bands/:id/delete") do
  band_id = params.fetch("id").to_i()
  @band = Band.find(band_id)
  @band.delete()
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end

get("/venues/:id") do
  @bands = Band.all()
  @venue = Venue.find(params.fetch("id").to_i())
  erb(:venue_info)
end

patch("/venues/:id") do
  venue_id = params.fetch("id").to_i()
  @venue = Venue.find(venue_id)
  band_ids = params.fetch("band_ids") + @venue.band_ids
  @venue.update({:band_ids => band_ids})
  @bands = Band.all()
  erb(:venue_info)
end
