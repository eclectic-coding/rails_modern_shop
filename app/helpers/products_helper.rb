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

  def product_status(product)
    if product.product_available == false
      tag.div class: "my-2" do
        tag.span class: "badge bg-info" do
          t(".archived")
        end
      end
    elsif product.status == "active"
      tag.div class: "my-2" do
        tag.span class: "badge bg-success" do
          t(".active")
        end
      end
    elsif product.status == "inactive"
      tag.div class: "my-2" do
        tag.span class: "badge bg-danger" do
          t("admin.products.show.out_of_stock")
        end
      end
    end
  end
end
