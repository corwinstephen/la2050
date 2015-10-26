RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  [Comfy::Cms::Block, Comfy::Cms::Categorization, Comfy::Cms::File, Comfy::Cms::Category, Comfy::Cms::Layout, Comfy::Cms::Page, Comfy::Cms::Revision, Comfy::Cms::Site, Comfy::Cms::Snippet, Comfy::Blog::Blog, Comfy::Blog::Post, GoalTagging].each do |model|
    config.excluded_models << model
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    config.model 'Metric' do
      visible true
      list do
        field :name
        field :description
        field :target_description
        field :dream
        field :data_unit
        field :goals
      end
    end

    config.model 'Job' do
      visible true
      edit do
        field :title
        field :employment_type
        field :location
        field :description, :ck_editor
        field :to_apply, :ck_editor
        field :date_posted
        field :goals
        field :organizations
      end
    end

  end
end
