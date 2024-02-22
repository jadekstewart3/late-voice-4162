require "rails_helper"

RSpec.describe type: :feature do 
  describe "As a visitor" do 
    describe "When I visit the items index page" do 
      before(:each) do 
        soops = Supermarket.create!(name: "King Soopies", location: "333 happy St.")
        bodega = Supermarket.create!(name: "Downtown bodega mart", location: "333 happy St.")
        @phil = Customer.create!(name: "Philip DeFraties")
        @jade = Customer.create!(name: "Jade DeFraties")
        @chippies = Item.create!(name: "La Favorita", price: 3, supermarket_id: soops.id)
        @cheetos = Item.create!(name: "Cheetos", price: 3, supermarket_id: bodega.id)
        @dippies = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: soops.id)
        @ranch = Item.create!(name: "Ranch", price: 4, supermarket_id: bodega.id)
        @celery = Item.create!(name: "Celery", price: 2, supermarket_id: soops.id)
        @carrots = Item.create!(name: "Carrots", price: 2, supermarket_id: bodega.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @chippies.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @chippies.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @dippies.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @dippies.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @cheetos.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @carrots.id)
        visit items_path
      end

      it "displays a list of all items with their name, price, and supermarket" do 
       expect(page).to have_content("Item: La Favorita")
       expect(page).to have_content("Price: $3")
       expect(page).to have_content("Supermarket: King Soopies")
       expect(page).to have_content("Customers that purchased: 2")
      end 
    end
  end
end