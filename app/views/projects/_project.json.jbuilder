json.extract! project, :id, :title, :short_descr, :long_descr, :complexity, :date, :images, :slug, :created_at, :updated_at
json.url project_url(project, format: :json)
