require "liveai/version"
require 'net/http'
require 'uri'
require 'json'
require 'logger'

module Liveai

  class Query

    attr_reader :result

    def send(data)

      logger = Logger.new('./liveai.log')
        #params = URI.encode_www_form({ param1: 'foo', param2: 'bar baz' , param3: 'あ' })
      params = URI.encode_www_form({data: data})

      uri = URI.parse("http://localhost:3000?#{params}")

      begin
        response = Net::HTTP.start(uri.host, uri.port) do |http|
          http.open_timeout = 5
          http.read_timeout = 10
          http.get(uri.request_uri)
        end

        case response
        when Net::HTTPSuccess
          p JSON.parse(response.body)
          self.result = JSON.parse(response.body)
        when Net::HTTPRedirection
          logger.warn("Redirection: code=#{response.code} message=#{response.message}")
        else
          logger.error("HTTP ERROR: code=#{response.code} message=#{response.message}")
        end
      rescue IOError => e
        logger.error(e.message)
      rescue TimeoutError => e
        logger.error(e.message)
      rescue JSON::ParserError => e
        logger.error(e.message)
      rescue => e
        logger.error(e.message)
      end
    end
  end
end
