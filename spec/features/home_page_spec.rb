require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  
  let(:valid_student_attributes) {
    {email: 'email@gmail.com', username: 'Username', password: 'password'}
  }

  scenario "The visitor should see projects" do
    Student.create! valid_student_attributes
    visit root_path
    expect(page).to have_text("Kyle's Project Portal")
  end
end
