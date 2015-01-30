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

  it("will alphabetize the bands") do
    band2 = Band.create({:band => "stone temple pilots"})
    band1 = Band.create({:band => "nirvana"})
    expect(Band.alphabetical()).to(eq([band1, band2]))
  end
end
