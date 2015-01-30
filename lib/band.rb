class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:band, {:presence => true})
  before_save(:capitalize_band)
  scope(:alphabetical, -> {order(:band)})
  
private
  define_method(:capitalize_band) do
    self.band=(band().capitalize())
  end
end
