require 'active_support/configurable'
module Liveai

  def self.configure(&block)
    yield @config ||= Liveai::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :hoge_configure
  end

  configure do |config|
    config.token = ""
    config.key = ""
  end
end