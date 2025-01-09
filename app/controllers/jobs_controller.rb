class JobsController < ApplicationController
  def search
    job_title = params[:job_title]
    location = params[:location].present? ? params[:location] : 'San Francisco'

    glassdoor_service = GlassdoorService.new(ENV['GLASSDOOR_PARTNER_ID'], ENV['GLASSDOOR_API_KEY'])
    @jobs = glassdoor_service.search_jobs(job_title, location, 10)

    if @jobs.empty?
      @error_message = "No jobs found for #{job_title} in #{location}."
    end
  rescue => e
    @error_message = e.message
  end
end
