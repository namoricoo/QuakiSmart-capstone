class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.float :mag
      t.string :place
      t.float :latitude
      t.float :longitude
      t.integer :tsunami
      t.integer :felt
      t.float :cdi
      t.float :dmin

      t.timestamps
    end
  end
end
