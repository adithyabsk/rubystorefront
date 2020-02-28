require "rails_helper"

RSpec.describe Category, :type => :model do
  it "must have a name" do
	category = Category.new(name: nil)
	expect(category).to_not be_valid
  end
  it "must have a name that contains only letters" do
	category = Category.new(name: "123456789")
	expect(category).to_not be_valid
  end
  it "is must have a tax slab" do
	category = Category.new(tax_slab: nil)
	expect(category).to_not be_valid
  end
  it "is must have a tax_slab that is a number" do
	category = Category.new(tax_slab: "onetwothree")
	expect(category).to_not be_valid
  end
  it "is must have a tax_slab that is less than 1" do
	category = Category.new(tax_slab: 2)
	expect(category).to_not be_valid
  end
  it "is must have a tax_slab that is greater than 0" do
	category = Category.new(tax_slab: -1)
	expect(category).to_not be_valid
  end
end