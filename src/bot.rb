# -*- coding: utf-8 -*-
CurrentDir = File.expand_path(File.dirname(__FILE__))

require "twitter"
require "yaml"
require "generate_text"
require "logger"
require "#{CurrentDir}/generate_text.rb"

class Bot
  def initialize
    @config = YAML.load_file("../config.yaml")
    Twitter.configure do |config|
      config.consumer_key = @config["consumer_key"]
      config.consumer_secret = @config["consumer_secret"]
      config.oauth_token = @config["oauth_token"]
      config.oauth_token_secret = @config["oauth_token_secret"]
    end
    @client = Twitter::Client.new
  end

  def update(str)
    @client.update(str)
  end
end


if __FILE__ == $0
  bot = Bot.new
end
