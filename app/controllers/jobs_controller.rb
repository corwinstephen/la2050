class JobsController < ApplicationController
  include ActionView::Helpers::DateHelper
  def show
    @job = Job.find(params[:id])

    render :cms_layout => 'job', :cms_blocks => {
      job_title: @job.title,
      employment_type: @job.employment_type,
      posted: time_ago_in_words(@job.date_posted),
      location: @job.location,
      description: @job.description,
      to_apply: @job.to_apply,
      organizations: @job.organizations.map(&:name).join(', ')
    }
  end
end