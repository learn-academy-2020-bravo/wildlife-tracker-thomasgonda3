require "rails_helper"

RSpec.describe "Animal", :type => :request do

  it "is valid with common and latin name" do
    animal_test = Animal.create common_name: "Goat", latin_name: "Capra", kingdom:"Animalia"
    expect(animal_test).to be_valid
  end

  it "is not valid with same common and latin name" do
    animal_test = Animal.create common_name: "Goat", latin_name: "Goat", kingdom:"Animalia"
    expect(animal_test).to_not be_valid
  end

  it "is not valid with common name already in database" do
    Animal.create common_name: "Goat", latin_name: "Johnny", kingdom:"Animalia"
    animal_test = Animal.create common_name: "Goat", latin_name: "Capra", kingdom:"Animalia"
    expect(animal_test).to_not be_valid
  end

  it "is not valid with latin name already in database" do
    Animal.create common_name: "Goat", latin_name: "Johnny", kingdom:"Animalia"
    animal_test = Animal.create common_name: "Woat", latin_name: "Johnny", kingdom:"Animalia"
    expect(animal_test).to_not be_valid
  end

end
