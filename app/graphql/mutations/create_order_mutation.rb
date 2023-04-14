module Mutations
    class CreateOrderMutation < Mutations::BaseMutation
        argument :user_id, ID, required: true
        argument :quantity, Int, required: true
        argument :address, String, required: true

        field :order, Types::OrderType, null: true
        field :errors, [String], null: false

        def resolve(user_id:, quantity:, address:)
            user = User.find(user_id)
            return { errors: ['User does not exist'] } if user.blank?

            order = Order.new(user_id:, quantity:, address:, status: 'pending')
            
            if order.save
                { order: order, errors: [] }
            else
                { errors: order.errors.full_messages }
            end
        end
    end
end