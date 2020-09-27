# Write your code here
require 'net/http'
require 'json'
require 'open-uri'
require 'awesome_print'
class GetRequester
    
    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        programs = JSON.parse(self.get_response_body)
    end
end

program = GetRequester.new("http://www.omdbapi.com/?t=black+panther&apikey=6375022c")
puts program.parse_json.uniq