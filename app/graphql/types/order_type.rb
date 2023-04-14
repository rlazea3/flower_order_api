module Types
    class OrderType < Types::BaseObject
        field :id, ID, null: false
        field :user, Types::UserType, null: false
        field :status, String, null: false
        field :quantity, Int, null: false
        field :address, String, null: false
    end
end