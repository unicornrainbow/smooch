module Smooch
  API_KEY = ''

  def self.ab_static?
    !!@ab_static
  end
  def self.ab_static=val
    @ab_static=val
  end

end

begin
  config = YAML.load_file("#{Rails.root}/config/kissmetrics.yml")
  Smooch::API_KEY = config[Rails.env]['apikey'] if config[Rails.env]
rescue
  puts "Error opening KISSmetrics configuration file."
end

require 'smooch/base'
require 'smooch/helpers'
require 'smooch/controller'



ActionController::Base.class_eval do
  extend Smooch::Controller
end
