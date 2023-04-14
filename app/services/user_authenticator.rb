class UserAuthenticator
    extend Dry::Initializer

    option :username
    option :password
    
    def call
        JsonWebToken.encode({username:}) if user
    end

    def user
        user = User.find_by(username:)
        return user if user && user.authenticate(password)
        nil
    end
end