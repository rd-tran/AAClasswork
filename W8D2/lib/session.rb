require 'json'
require 'byebug'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @session_token = if req.cookies.has_key?('_rails_lite_app')
                JSON.parse(req.cookies['_rails_lite_app'])
              else
                {}
              end
  end

  def [](key)
    @session_token[key]
  end

  def []=(key, val)
    @session_token[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie(
      '_rails_lite_app',
      path: '/',
      value: JSON.unparse(@session_token)
    )
  end
end
