
module Phase8

  class Flash

    def initialize(req)
      flash = req.cookies.find { |cookie| cookie.name == "_rails_lite_app_flash" }

      @flash_later = {}

      if flash
        @flash_now = JSON.parse(flash.value)
      else
        @flash_now = {}
      end
    end

    def [](key)
      if @flash_now.empty?
        @flash_later[key.to_s]
      else
        @flash_now[key]
      end
    end

    def []=(key, value)
      @flash_later[key.to_s] = value
    end

    def now
      @flash_now
    end

    def store_flash(res)
      res.cookies << WEBrick::Cookie.new("_rails_lite_app_flash", @flash_later.to_json)
    end

  end

end
