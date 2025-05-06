require 'net/http'
require 'json'

def get_request(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"

  output = {
    status_code: response.code.to_i,
    body: response.body
  }

  puts JSON.pretty_generate(output)
end