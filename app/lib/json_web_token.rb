class JsonWebToken
    class << self
        def encode(payload)
            payload[:exp] = Time.now.to_i + 24 * 3600
            JWT.encode(payload, Rails.application.secret_key_base.to_s)
        end

        def decode(token)
            JWT.decode(token, Rails.application.secret_key_base.to_s).first.with_indifferent_access
        rescue
            nil
        end
    end
end