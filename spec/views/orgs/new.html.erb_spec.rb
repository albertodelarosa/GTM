require 'rails_helper'

RSpec.describe "orgs/new", type: :view do
  before(:each) do
    assign(:org, Org.new(
      :name => "MyString",
      :subdomain => "MyString"
    ))
  end

  it "renders new org form" do
    render

    assert_select "form[action=?][method=?]", orgs_path, "post" do

      assert_select "input#org_name[name=?]", "org[name]"

      assert_select "input#org_subdomain[name=?]", "org[subdomain]"
    end
  end
end
