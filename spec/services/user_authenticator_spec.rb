require 'rails_helper'

RSpec.describe UserAuthenticator, type: :service do
    let(:user) { FactoryBot.create(:user) }
    let(:key) { Rails.application.secret_key_base }
    let(:token) { JWT.encode({ username: user.username, exp: JsonWebToken::EXPIRY_TIME }, key) }

    before do
        Timecop.freeze(Time.local(2023))
    end

    it 'returns token if user exists' do
        expect(UserAuthenticator.new(username: user.username, password: user.password).call).to eq(token)
    end

    it 'returns nil if user does not exist' do
        expect(UserAuthenticator.new(username: 'user2', password: 'pass').call).to be_nil
    end
end