require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :username => "MyString",
      :password => "MyString",
      :degrees => "MyText",
      :introduction => "MyText",
      :resume => "MyText",
      :image => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[username]"

      assert_select "input[name=?]", "student[password]"

      assert_select "textarea[name=?]", "student[degrees]"

      assert_select "textarea[name=?]", "student[introduction]"

      assert_select "textarea[name=?]", "student[resume]"

      assert_select "input[name=?]", "student[image]"
    end
  end
end
