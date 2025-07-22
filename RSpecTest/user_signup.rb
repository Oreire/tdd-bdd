# user_signup.rb

def register_user(username, email, password)
  unless username.is_a?(String) && !username.empty?
    raise ArgumentError, 'Username must be a non-empty string'
  end

  unless email =~ /\A[^@\s]+@[^@\s]+\z/
    raise ArgumentError, 'Invalid email format'
  end

  unless password.is_a?(String) && password.length >= 8
    raise ArgumentError, 'Password must be at least 8 characters long'
  end

  # Simulated return value (in real world, you'd hash and save to DB)
  { username: username, email: email }
end
