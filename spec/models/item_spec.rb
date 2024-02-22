require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe "instance methods" do 
    before(:each) do 
        soops = Supermarket.create!(name: "King Soopies", location: "333 happy St.")
        bodega = Supermarket.create!(name: "Downtown Bodega Mart", location: "333 happy St.")
        @phil = Customer.create!(name: "Philip DeFraties")
        @jade = Customer.create!(name: "Jade DeFraties")
        @chippies_1 = Item.create!(name: "La Favorita", price: 3, supermarket_id: soops.id)
        @dippies_1 = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: soops.id)
        @dippies_2 = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: bodega.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @chippies_1.id)
        CustomerItem.create!( customer_id: @phil.id, item_id: @dippies_1.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @dippies_2.id)
        CustomerItem.create!( customer_id: @jade.id, item_id: @dippies_1.id)
      end
    it "returns the number of customers that purchased that item" do 
      expect(@chippies_1.customer_count).to eq(1)
      expect(@dippies_1.customer_count).to eq(2)
      expect(@dippies_2.customer_count).to eq(1)
    end
  end

end