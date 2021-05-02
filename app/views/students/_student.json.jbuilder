json.extract! student, :id, :username, :password, :degrees, :introduction, :resume, :image, :created_at, :updated_at
json.url student_url(student, format: :json)
