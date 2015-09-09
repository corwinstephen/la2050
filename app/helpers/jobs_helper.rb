module JobsHelper
  def jobs_from_params
    Job.order("jobs.date_posted DESC")
  end
end