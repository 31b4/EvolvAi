class GlassdoorService
  include HTTParty
  base_uri 'https://api.glassdoor.com/api/api.htm'

  def initialize(partner_id, api_key)
    @partner_id = partner_id
    @api_key = api_key
    @user_ip = '192.168.1.1'
    @user_agent = 'Mozilla/5.0'
  end

  def search_jobs(job_title, location = 'San Francisco', results_per_page = 10)
    response = self.class.get('', {
      query: {
        't.p' => @partner_id,
        't.k' => @api_key,
        'userip' => @user_ip,
        'useragent' => @user_agent,
        'action' => 'jobs',
        'q' => job_title,
        'l' => location,
        'ps' => results_per_page,
        'format' => 'json',
        'v' => '1.1'
      }
    })

    if response.success?
      job_listings = response.parsed_response['response']['jobListings']
      return job_listings || []
    else
      raise "Hiba: #{response.message}"
    end
  end
end
