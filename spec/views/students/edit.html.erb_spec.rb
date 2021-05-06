require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :username => "MyString",
      :email => "MyEmail@gmail.com",
      :password => "MyString",
      :degrees => "MyText",
      :introduction => "MyText",
      :resume => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[username]"

      assert_select "input[name=?]", "student[password]"

      assert_select "textarea[name=?]", "student[degrees]"

      assert_select "textarea[name=?]", "student[introduction]"

      assert_select "textarea[name=?]", "student[resume]"

      assert_select "input[name=?]", "student[image]"
    end
  end
end
