require('spec_helper')

describe(Venue) do
  it {should have_and_belong_to_many (:bands)}
  it("validates presence of venue name") do
    venue = Venue.new({:venue => ''})
    expect(venue.save()).to(eq(false))
  end
end
