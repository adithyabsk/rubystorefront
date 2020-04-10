# frozen_string_literal: true

# rubocop:disable RSpec/LetSetup

require 'rails_helper'
require 'database_cleaner/active_record'
describe ItemsController do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean

  let!(:admin) { create(:user, id: 1, admin: true) }
  let!(:category1) { create(:category, id: 1) }
  let!(:item1) { create(:item, id: 1, category_id: 1) }
  let!(:item2) { create(:item, id: 2, category_id: 1) }
  let!(:item3) { create(:item, id: 3, category_id: 1) }

  let(:item4) { build(:item, id: 4, category_id: 1) }

  # Actually think this automatically sorts by popularity but idk how
  describe 'GET #index' do
    it 'assigns @items and sorts by id (high to low) when there is no param[:sort]' do
      allow(controller).to receive(:params).and_return({ sort: '' })
      get :index
      items = [item3, item2, item1]
      assigns(:items).should eq(items)
    end

    it 'reders the index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested item to @item' do
      get :show, params: { id: 1 }
      assigns(:item).should eq(item1)
    end

    it 'renders the show view' do
      get :show, params: { id: 1 }
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns the new item to @item' do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end

    it 'renders the new view' do
      get :new, session: { user_id: 1 }
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    it 'creates a new item' do
      # expect{
      # post :create, params: {item: item4.attributes}, session: {user_id: 1}
      # post :create, params: {item: {name: 'item_name', cost: 5, brand: 'brand', inventory: 100, category_id: 1}}, session: {user_id: 1}
      # }.to change(Item, :count).by(1)
    end
  end
end
# rubocop:enable RSpec/LetSetup
