module Mutations
    class CreateOrderMutation < Mutations::BaseMutation
        argument :quantity, Int, required: true
        argument :address, String, required: true

        field :order, Types::OrderType, null: true
        field :errors, [String], null: false

        def authorized?(object)
            context[:current_user].present?
        end

        def resolve(quantity:, address:)
            order = Order.new(user: context[:current_user], quantity:, address:, status: 'pending')
            
            if order.save
                { order: order, errors: [] }
            else
                { errors: order.errors.full_messages }
            end
        end
    end
end