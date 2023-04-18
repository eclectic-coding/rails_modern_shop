module ProductsHelper
  def product_quantity(product)
    if product.quantity.zero?
      tag.div class: "my-2" do
        tag.span class: "badge bg-danger" do
          t(".out_of_stock")
        end
      end
    else
      tag.div class: "col-1 border rounded text-center py-1 my-2" do
        product.quantity.to_s
      end
    end
  end
end
