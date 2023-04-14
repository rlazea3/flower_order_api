module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :register_user, mutation: Mutations::RegisterUserMutation
    field :login, mutation: Mutations::LoginMutation
    field :create_order, mutation: Mutations::CreateOrderMutation
    field :update_order, mutation: Mutations::UpdateOrderMutation
  end
end
