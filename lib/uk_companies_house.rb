require 'faraday'
require 'faraday_middleware'
require 'json'

require "uk_companies_house/version"
require "uk_companies_house/client"
require "uk_companies_house/search"
require "uk_companies_house/officer"
require "uk_companies_house/company"

module UkCompaniesHouse
  class << self
    attr_accessor :api_key
  end

  self.api_key ||= ENV['UK_COMPANIES_HOUSE_API_KEY']
end
