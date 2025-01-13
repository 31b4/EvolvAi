require 'net/http'
require 'json'

class AdzunaService
  BASE_URL = "https://api.adzuna.com/v1/api/jobs".freeze

  def self.search_jobs(query, location = "gb", page = 1)
    url = URI("#{BASE_URL}/#{location}/search/#{page}?app_id=#{ENV['ADZUNA_APP_ID']}&app_key=#{ENV['ADZUNA_APP_KEY']}&what=#{query}")
    response = Net::HTTP.get(url)
    JSON.parse(response)
  rescue StandardError => e
    Rails.logger.error("Adzuna API Error: #{e.message}")
    nil
  end
end
