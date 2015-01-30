require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many (:bands)}

  it("validates presence of venue name") do
    venue = Venue.new({:venue => ''})
    expect(venue.save()).to(eq(false))
  end

  it("will capitalize the first letter of the venue") do
    venue = Venue.create({:venue => "refuge pdx"})
    expect(venue.venue()).to(eq("Refuge pdx"))
  end

  it("will alphabetize the venues") do
    venue2 = Venue.create({:venue => "refuge pdx"})
    venue1 = Venue.create({:venue => "branx"})
    expect(Venue.alphabetical()).to(eq([venue1, venue2]))
  end
end
