module ApplicationHelper
  include Pagy::Frontend

  def date_timestamp(date)
    date.nil? ? "" : date.strftime("%m-%d-%Y %I:%M:%S %p")
  end

  def sort_link(column:, label:)
    if column == params[:column]
      link_to(label, list_admin_products_path(column: column, direction: next_direction), class: "text-black text-decoration-none ms-3")
    else
      link_to(label, list_admin_products_path(column: column, direction: "asc"), class: "text-black text-decoration-none ms-3")
    end
  end

  def next_direction
    (params[:direction] == "asc") ? "desc" : "asc"
  end

  def sort_indicator
    tag.div(class: "sort sort-#{params[:direction]}")
  end
end
