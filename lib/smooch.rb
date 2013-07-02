module Smooch
  API_KEY = ''

  def self.ab_static?
    !!@ab_static
  end
  def self.ab_static=val
    @ab_static=val
  end

end

require 'smooch/base'
require 'smooch/helpers'
require 'smooch/controller'

ActionController::Base.class_eval do
  extend Smooch::Controller
end
