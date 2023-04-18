class Order < ApplicationRecord
  belongs_to :user

  STATUSES = %w[pending delivered canceled]

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :status, presence: true,
                     inclusion: { in: STATUSES, message: "must be one of the following: #{STATUSES.join(', ')}" } 
end
