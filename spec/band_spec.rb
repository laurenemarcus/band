require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many (:venues)}
  it("validates presence of band name") do
    band = Band.new({:band => ''})
    expect(band.save()).to(eq(false))
  end

  it("will capitalize the name of the band") do
    band = Band.create({:band => "nirvana"})
    expect(band.band()).to(eq("Nirvana"))
  end
end
