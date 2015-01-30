require('spec_helper')

describe(Band) do
  it {should have_and_belong_to_many (:venues)}
  it("validates presence of band name") do
    band = Band.new({:band => ''})
    expect(band.save()).to(eq(false))
  end
end
