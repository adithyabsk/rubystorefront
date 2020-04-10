# frozen_string_literal: true

require 'rails_helper'

describe Item do
  subject(:item) do
    described_class.new(name: 'test_item',
                        cost: 100,
                        brand: 'test_brand',
                        inventory: 100,
                        category_id: 1,
                        image_url: 'test_url.png')
  end

  it 'is valid with valid attributes' do
    expect(item).to be_valid
  end

  it 'is not valid without a name' do
    item.name = nil
    expect(item).not_to be_valid
  end

  it 'is not valid without a cost' do
    item.cost = nil
    expect(item).not_to be_valid
  end

  it 'is not valid with a cost less than 0' do
    item.cost = -100
    expect(item).not_to be_valid
  end

  it 'is not valid without a brand' do
    item.brand = nil
    expect(item).not_to be_valid
  end

  it 'is not valid without an inventory count' do
    item.inventory = nil
    expect(item).not_to be_valid
  end

  it 'is not valid with an inventory count less than 0' do
    item.inventory = -100
    expect(item).not_to be_valid
  end

  it 'is not valid without a category id' do
    item.category_id = nil
    expect(item).not_to be_valid
  end

  it 'is valid without an image_url' do
    item.image_url = nil
    expect(item).to be_valid
  end
end
