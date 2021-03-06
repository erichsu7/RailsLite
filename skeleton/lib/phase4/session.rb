require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      cookie = req.cookies.find { |cookie| cookie.name == "_rails_lite_app" }
      if cookie
        @cookie = JSON.parse(cookie.value)
      else
        @cookie = {}
      end
    end

    def [](key)
      @cookie[key.to_s]
    end

    def []=(key, val)
      @cookie[key.to_s] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new("_rails_lite_app", @cookie.to_json)
    end
  end
end
