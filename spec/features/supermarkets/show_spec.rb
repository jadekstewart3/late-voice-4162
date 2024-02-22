require "rails_helper"

RSpec.describe type: :feature do 
  describe "As a visitor" do 
    describe "When i visit the supermarket show page" do 
      before(:each) do 
        soops = Supermarket.create!(name: "King Soopies", location: "333 happy St.")
        @phil = Customer.create!(name: "Philip DeFraties")
        @jade = Customer.create!(name: "Jade DeFraties")
        @chippies = Item.create!(name: "La Favorita", price: 3, supermarket_id: soops.id)
        @dippies = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: soops.id)
        @celery = Item.create!(name: "Celery", price: 2, supermarket_id: soops.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @chippies.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @chippies.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @dippies.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @dippies.id)
        visit supermarket_path(soops)
      end
      it "displays a list of unique customers that have shopped at that market" do 
        expect(page).to have_content(@jade.name, :count => 1)
        expect(page).to have_content(@phil.name, :count => 1)
      end
    end
  end
end