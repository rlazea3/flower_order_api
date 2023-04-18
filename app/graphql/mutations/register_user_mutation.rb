module Mutations
	class RegisterUserMutation < Mutations::BaseMutation
		argument :username, String, required: true
		argument :password, String, required: true

		field :token, String, null: true
		field :errors, [String], null: false

		def resolve(username:, password:)
			user = User.find_by(username:)
			return { errors: ['Username already exists'] } if user.present?

			user = User.create(username:, password:)
			{ token: UserAuthenticator.new(username:, password:).call, errors: [] }
		end

		def secret_key_base
			Rails.application.secret_key_base.to_s
		end

		def generate_token(username)
			payload = { username:, exp: Time.now.to_i + 24 * 3600 }
			JWT.encode(payload, secret_key_base)
		end
	end
end