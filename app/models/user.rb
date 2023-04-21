class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
    :recoverable, :rememberable, :validatable

  has_person_name

  enum role: {
    admin: "admin",
    customer: "customer"
  }

  FILTER_PARAMS = %i[name column direction].freeze

  def self.filter(filters)
    User.order("#{filters["column"]} #{filters["direction"]}")
  end
end
