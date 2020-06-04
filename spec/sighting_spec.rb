require "rails_helper"

RSpec.describe "Sighting", :type => :request do

  it "is valid with latitude, longitude, and date" do
    a = Animal.create common_name: "Goat", latin_name: "Capra", kingdom:"Animalia"
    sightings_test = a.sightings.create latitude:"50", longitude:"-20", date:"2020-05-06 08:32:21"
    expect(sightings_test).to be_valid
  end

end
