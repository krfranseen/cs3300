require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Short descr", with: "Test description"
      login_as(FactoryBot.create(:student))
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Short descr can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", short_descr: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Short descr", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Short descr", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Short descr can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", short_descr: "Test content") }
    scenario "remove project" do
      login_as(FactoryBot.create(:student))
      visit projects_path
      click_link "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end
