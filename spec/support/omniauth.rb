# frozen_string_literal: true

def facebook_mock(name)
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
    provider: 'facebook',
    info: { name: name }
  )
end
