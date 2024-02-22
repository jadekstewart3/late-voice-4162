require "rails_helper"

RSpec.describe type: :feature do 
  describe "As a visitor" do
    describe "When I visit the customer's show page" do 
      before(:each) do 
        soops = Supermarket.create!(name: "King Soopies", location: "333 happy St.")
        @phil = Customer.create!(name: "Philip DeFraties")
        @chippies = Item.create!(name: "La Favorita", price: 3, supermarket_id: soops.id)
        @dippies = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: soops.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @chippies.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @dippies.id)
        visit customer_path(@phil)
      end

      it "displays the customer's name" do 
        expect(page).to have_content("Philip DeFraties")
      end

      it "displays a list of customer items with thir attributes" do 
        expect(page).to have_content(@chippies.name)
        expect(page).to have_content(@dippies.name)
      end
    end
  end
end