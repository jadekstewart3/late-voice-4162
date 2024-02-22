require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  describe "Relationships" do 
    it { should belong_to :customer }
    it { should belong_to :item }
  end
end
