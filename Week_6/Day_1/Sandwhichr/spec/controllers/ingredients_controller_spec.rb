require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  describe "GET #index" do
    it 'should return success code(200)' do
      get :index

      expect(response.code).to eq("200")
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end



  end

  describe "GET #show" do
    before{@ingredient = Ingredient.create(name: "Carrot", calories: 122)}
    it "Shows an ingredient" do

      get :show, params: {id: @ingredient.id}
      expect(response).to be_success
      @ingredient.destroy
    end

    it "Does not show an ingredient that doesnt exist. Returns 404" do
      get :show, params: {id: 55}
      expect(response.code).to eq("404")

    end
  end


  describe "POST #create" do
    before{@test = Ingredient.create(name: "mayo", calories: "155")}

    it "creates a new Ingredient" do
      expect{
        post :create, params: {ingredient: {name: "carrot", calories: 123}}
      }.to change(Ingredient, :count).by(1)
    end


    it "destroys just one ingredient" do
      expect{
        delete :destroy, :id => @test.id
      }.to change(Ingredient, :count).by(-1)
    end

    it "destroys the right ingredient" do
        delete :destroy, :id => @test.id
        get :show, {id: @test.id}
        expect(response.code).to eq("404")
    end
  end



end
