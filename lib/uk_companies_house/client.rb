module UkCompaniesHouse

  class Client
    attr_accessor :api_key

    def initialize(api_key: nil)
      @api_key = api_key || UkCompaniesHouse.api_key
    end

    def connection
      @connection ||= begin
        Faraday.new(:url => 'https://api.companieshouse.gov.uk/') do |faraday|
          faraday.headers['Authorization'] = @api_key
          faraday.response :json, :content_type => /\bjson$/
          faraday.adapter Faraday.default_adapter
        end
      end
    end

    def post(url, data = {})
      connection.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

    def get(url, data = {})
      connection.get do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.params = data
        #req.body = data.to_json
      end
    end

  end
end
