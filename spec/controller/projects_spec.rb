# Test the project controller

require "rails_helper"

RSpec.describe ProjectsController, type: :controller do

  let(:valid_student_attributes) {
    {email: 'email@gmail.com', username: 'Username', password: 'password'}
  }
  
  context "GET #index" do
    it "returns a success response" do
      Student.create! valid_student_attributes
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end
                  
  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", short_descr: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end
