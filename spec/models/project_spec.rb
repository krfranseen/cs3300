# For testing the project model

require "rails_helper"
require 'date'

RSpec.describe Project, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      project = Project.new(short_descr: "Content of the description")
      expect(project.valid?).to eq(false)
    end
      
    it "ensures the short description is present" do
      project = Project.new(title: "Title")
      expect(project.valid?).to eq(false)
    end
                  
    it "should be able to save project" do
      project = Project.new(title: "Title", short_descr: "Some description content goes here")
      expect(project.save).to eq(true)
    end

    it "should be able to save project with long descr" do
      project = Project.new(title: "Title", short_descr: "Some description content goes here", long_descr: "MORE INFO")
      expect(project.save).to eq(true)
    end

    it "should be able to save project with complexity" do
      project = Project.new(title: "Title", short_descr: "Some description content goes here", complexity: 1)
      expect(project.save).to eq(true)
    end

    it "should be able to save project with date" do
      project = Project.new(title: "Title", short_descr: "Some description content goes here", date: DateTime.new(2001,2,3,4,5,6))
      expect(project.save).to eq(true)
    end

    it "should be able to save project with images" do
      project = Project.new(title: "Title", short_descr: "Some description content goes here", images: "example.jpg")
          expect(project.save).to eq(true)
          end    
  end
 
  context "scopes tests" do
    let(:params) { { title: "Title", short_descr: "some description" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end
        
    it "should return all projects" do
      expect(Project.count).to eq(3)
    end
  end
end
