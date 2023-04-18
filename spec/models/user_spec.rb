require 'rails_helper'

RSpec.describe User, type: :model do
    it 'is valid with valid attributes' do
        expect(described_class.new(username: 'user1', password: 'pass')).to be_valid
    end

    it 'is not valid without an username' do
        expect(described_class.new(username: nil, password: 'pass')).to_not be_valid
    end

    it 'is not valid without a password' do
        expect(described_class.new(username: 'user1', password: nil)).to_not be_valid
    end
end