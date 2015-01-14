require 'uri'
require 'byebug'

require 'activesupport'

def parse_www_encoded_form(www_encoded_form)
  URI::decode_www_form(www_encoded_form).each do |attr, value|
    @params = @params.deep_merge(parse_key(attr).reverse.inject(value) { |a, b| {b => a} })
  end
end

def parse_key(key)
  key.split(/\]\[|\[|\]/)
end

parse_www_encoded_form("user[address][street]=main&user[address][zip]=89436").each do |el|
p el
end
