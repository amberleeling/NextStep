require 'uri'
require 'net/http'
require 'json'

class FantasticJobsClient
  BASE_URL = 'https://linkedin-job-search-api.p.rapidapi.com/active-jb-7d'

  def initialize(api_key:)
    @api_key = api_key
    @params = {
      limit: 10,
      offset: 0,
      title_filter: nil,
      location_filter: []
    }
  end

  def job_title(title)
    @params[:title_filter] = title
    self
  end

  def locations(*locations)
    @params[:location_filter] = locations
    self
  end

  def limit(limit)
    @params[:limit] = limit
    self
  end

  def offset(offset)
    @params[:offset] = offset
    self
  end

  def search
    url = build_url
    response = make_request(url)
    JSON.parse(response.body)
  end

  private

  def build_url
    query_params = @params.compact.map do |key, value|
      if key == :location_filter && value.any?
        locations = value.map { |loc| "%22#{URI.encode_www_form_component(loc)}%22" }.join(' OR ')
        "#{key}=#{locations}"
      elsif key == :title_filter
        "#{key}=%22#{URI.encode_www_form_component(value)}%22"
      else
        "#{key}=#{value}"
      end
    end.join('&')

    URI("#{BASE_URL}?#{query_params}")
  end

  def make_request(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-key"] = @api_key
    request["x-rapidapi-host"] = 'linkedin-job-search-api.p.rapidapi.com'

    http.request(request)
  end
end
