require 'rails_helper'

describe ItemsController do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET #show" do
    it "renders the :show template" do
      get :show, params:{ id: 1}
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @item" do
      item = create(:item)
      get :edit, params: {id: item}
      expect(assigns(:item)).to eq item
    end

    it "renders the :edit template" do
      item = create(:item)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #search' do
    it "renders the :search template" do
      get :search
      expect(response).to render_template :search
    end
  end

  describe 'GET #search_item' do
    it "renders the :search_item template" do
      get :search_item
      expect(response).to render_template :search_123
    end
  end
end

