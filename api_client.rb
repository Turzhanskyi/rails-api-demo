# frozen_string_literal: true

require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter Faraday.default_adapter
  config.token_auth('62534b7d9402908319bd2cd443e83938')
end

response = client.post do |req|
  req.url '/api/v1/posts'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "post": {"title": "Title", "body": "Text"} }'
end

puts Oj.load(response.body)
puts response.status

# run script: ruby api_client.rb
