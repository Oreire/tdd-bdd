# spec/user_signup_spec.rb

require_relative '../user_signup'

RSpec.describe '#register_user' do
  context 'with valid inputs' do
    it 'returns a hash with username and email' do
      result = register_user('ajayi', 'ajayi@example.com', 'securePass123')
      expect(result[:username]).to eq('ajayi')
      expect(result[:email]).to eq('ajayi@example.com')
    end
  end

  context 'with invalid usernames' do
    it 'raises error for empty username' do
      expect { register_user('', 'ajayi@example.com', 'securePass123') }
        .to raise_error(ArgumentError, 'Username must be a non-empty string')
    end
  end

  context 'with invalid emails' do
    it 'raises error for malformed email' do
      expect { register_user('ajayi', 'not-an-email', 'securePass123') }
        .to raise_error(ArgumentError, 'Invalid email format')
    end
  end

  context 'with weak password' do
    it 'raises error for password shorter than 8 characters' do
      expect { register_user('ajayi', 'ajayi@example.com', '1234567') }
        .to raise_error(ArgumentError, 'Password must be at least 8 characters long')
    end
  end
end
