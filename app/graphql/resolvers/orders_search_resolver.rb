require 'search_object'
require 'search_object/plugin/graphql'

module Resolvers
    class OrdersSearchResolver < GraphQL::Schema::Resolver
        include SearchObject.module(:graphql)

        type [Types::OrderType], null: false

        scope { Order.all }

        option(:status, type: String) { |scope, value| scope.where(status: value) }
    end
end