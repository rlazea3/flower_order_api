class RequestAuthorizer
    extend Dry::Initializer

    option :headers

    def call
        user
    end

    def user
        @user ||= User.find_by(username: decoded_token[:username]) if decoded_token
    end

    def decoded_token
        @decoded_token ||= JsonWebToken.decode(header_token) if header_token
    end

    def header_token
        if headers['Authorization'].present?
            return headers['Authorization'].split(' ').last
        else
            return nil
        end
    end
end