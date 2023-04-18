module Mutations
    class UpdateOrderMutation < Mutations::BaseMutation
        argument :id, ID, required: true
        argument :quantity, Int, required: false
        argument :address, String, required: false
        argument :status, String, required: false

        field :order, Types::OrderType, null: true
        field :errors, [String], null: true

        def authorized?(order)
            order = Order.find_by(id: order[:id])
            context[:current_user] && order && context[:current_user] == order.user
        end

        def resolve(id:, **args)
            order = Order.find_by(id: id)
            return { errors: ['Order does not exist'] } if order.blank?

            if order.update(args.compact)
                { order: order, errors: [] }
            else
                { order: nil, errors: order.errors.full_messages}
            end
        end
    end
end