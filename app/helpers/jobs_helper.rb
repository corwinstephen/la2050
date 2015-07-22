module JobsHelper
  def jobs_from_params
    if params[:goal].present?
      Job.includes(:goals).joins(:goals).where("goals.name = ?", params[:goal])
    else
      Job.all
    end
  end
end