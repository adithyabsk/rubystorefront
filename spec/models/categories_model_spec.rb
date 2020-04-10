# frozen_string_literal: true
# rubocop:disable all

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'must have a name' do
    category = described_class.new(name: nil)
    expect(category).not_to be_valid
  end

  it 'must have a name that contains only letters' do
    category = described_class.new(name: '123456789')
    expect(category).not_to be_valid
  end

  it 'is must have a tax slab' do
    category = described_class.new(tax_slab: nil)
    expect(category).not_to be_valid
  end

  it 'is must have a tax_slab that is a number' do
    category = described_class.new(tax_slab: 'onetwothree')
    expect(category).not_to be_valid
  end

  it 'is must have a tax_slab that is less than 1' do
    category = described_class.new(tax_slab: 2)
    expect(category).not_to be_valid
  end

  it 'is must have a tax_slab that is greater than 0' do
    category = described_class.new(tax_slab: -1)
    expect(category).not_to be_valid
  end
end
