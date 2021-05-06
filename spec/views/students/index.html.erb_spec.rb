require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :username => "Username",
        :email => "myemail@gmail.com",
        :password => "Password",
        :degrees => "MyDegree",
        :introduction => "MyIntro",
        :resume => "MyResume",
        :image => "Image"
      ),
      Student.create!(
        :username => "Username",
        :email => "email@gmail.com",
        :password => "Password",
        :degrees => "MyDegree",
        :introduction => "MyIntro",
        :resume => "MyResume",
        :image => "Image"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyDegree".to_s, :count => 2
    assert_select "tr>td", :text => "MyIntro".to_s, :count => 2
    assert_select "tr>td", :text => "MyResume".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
