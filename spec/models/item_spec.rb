require "rails_helper"

describe Item do
  subject {
    Item.new(name: "test_item",
             cost: 100,
             brand: "test_brand",
             inventory: 100,
             category_id: 1,
             image_url: "test_url.png")
  }
            
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cost" do
    subject.cost = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a cost less than 0" do
    subject.cost = -100
    expect(subject).to_not be_valid
  end

  it "is not valid without a brand" do
    subject.brand = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an inventory count" do
    subject.inventory = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with an inventory count less than 0" do 
    subject.inventory = -100
    expect(subject).to_not be_valid
  end

  it "is not valid without a category id" do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end

  it "is valid without an image_url" do
    subject.image_url = nil
    expect(subject).to be_valid
  end
end
