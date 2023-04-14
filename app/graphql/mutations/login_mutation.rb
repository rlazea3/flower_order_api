module Mutations
	class LoginMutation < Mutations::BaseMutation
		argument :username, String, required: true
		argument :password, String, required: true

		field :token, String, null: true
		field :errors, [String], null: false

		def resolve(username:, password:)
			token = UserAuthenticator.new(username:, password:).call
			token.present? ? { token:, errors: [] } : { errors: ['Invalid credentials'] }
		end
	end
end