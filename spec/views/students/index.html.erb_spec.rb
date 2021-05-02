require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :username => "Username",
        :password => "Password",
        :degrees => "MyText",
        :introduction => "MyText",
        :resume => "MyText",
        :image => "Image"
      ),
      Student.create!(
        :username => "Username",
        :password => "Password",
        :degrees => "MyText",
        :introduction => "MyText",
        :resume => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
