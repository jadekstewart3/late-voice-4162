class CustomerItemsController< ApplicationController
  def create
    customer = Customer.find(params[:customer_id])
    item = Item.find(params[:item_id])
    customer_item = CustomerItem.create!(customer_id: customer.id, item_id: item.id)
    if customer_item.save!
      redirect_to customer_path(customer)
    end
  end
end