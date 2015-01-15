require_relative '../phase9/url_helpers'
require_relative '../phase6/router'

module Phase9
  class Router < Phase6::Router
    include UrlHelpers

    def add_route(pattern, method, controller_class, action_name)
      super
      define_url_helper(controller_class, action_name)
    end
  end
end
