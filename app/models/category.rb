class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  def human_name
    name.humanize
  end

end
