class CreateTablesBandAndVenue < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:band, :string)
      t.timestamps
    end

    create_table(:venues) do |t|
      t.column(:venue, :string)
      t.timestamps
    end

    create_table(:bands_venues) do |t|
      t.column(:band_id, :int)
      t.column(:venue_id, :int)
      t.timestamps
    end
  end
end
