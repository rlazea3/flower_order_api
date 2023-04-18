class JsonWebToken
    EXPIRY_TIME = Time.now.to_i + 24 * 3600
    class << self
        def encode(payload)
            payload[:exp] = EXPIRY_TIME
            JWT.encode(payload, Rails.application.secret_key_base.to_s)
        end

        def decode(token)
            JWT.decode(token, Rails.application.secret_key_base.to_s).first.with_indifferent_access
        rescue
            nil
        end
    end
end