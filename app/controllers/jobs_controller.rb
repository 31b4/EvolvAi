class JobsController < ApplicationController
  def search
    query = params[:query]
    @jobs = AdzunaService.search_jobs(query)

    respond_to do |format|
      format.html { render :search_results }
      format.json { render json: @jobs }
    end
  end
end
