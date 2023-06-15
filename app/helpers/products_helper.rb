module ProductsHelper
  def product_quantity(product)
    if product.product_available == false
      tag.span class: "badge bg-info" do
        t(".archived")
      end
    elsif product.quantity.zero?
      tag.div class: "my-2" do
        tag.span class: "badge bg-danger" do
          t(".out_of_stock")
        end
      end
    elsif product.quantity.positive?
      tag.div class: "col-1 border rounded text-center py-1 my-2" do
        product.quantity.to_s
      end
    end
  end
end
