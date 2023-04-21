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

  FILTER_PARAMS = %i[role column direction].freeze

  scope :by_role, ->(role) { where(role: role) if role.present? }

  def self.filter(filters)
    User
      .by_role(filters["role"])
      .order("#{filters["column"]} #{filters["direction"]}")
  end
end
