require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customer_items).through(:items) }
    it { should have_many(:customers).through(:customer_items) }
  end
  describe "instance methods" do 
    before(:each) do 
      @soops = Supermarket.create!(name: "King Soopies", location: "333 happy St.")
      @phil = Customer.create!(name: "Philip DeFraties")
      @jade = Customer.create!(name: "Jade DeFraties")
      @chippies = Item.create!(name: "La Favorita", price: 3, supermarket_id: @soops.id)
      @dippies = Item.create!(name: "Sabra Hummus", price: 4, supermarket_id: @soops.id)
      @celery = Item.create!(name: "Celery", price: 2, supermarket_id: @soops.id)
      CustomerItem.create!( customer_id: @phil.id, item_id: @chippies.id)
      CustomerItem.create!( customer_id: @phil.id, item_id: @dippies.id)
      CustomerItem.create!( customer_id: @jade.id, item_id: @dippies.id)
      CustomerItem.create!( customer_id: @jade.id, item_id: @dippies.id)
    end

    it "returns a distinct list of customers" do 
      expect(@soops.supermarket_customers).to eq([@phil, @jade])
    end
  end
end