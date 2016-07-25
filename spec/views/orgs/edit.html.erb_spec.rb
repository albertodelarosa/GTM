require 'rails_helper'

RSpec.describe "orgs/edit", type: :view do
  before(:each) do
    @org = assign(:org, Org.create!(
      :name => "MyString",
      :subdomain => "MyString"
    ))
  end

  it "renders the edit org form" do
    render

    assert_select "form[action=?][method=?]", org_path(@org), "post" do

      assert_select "input#org_name[name=?]", "org[name]"

      assert_select "input#org_subdomain[name=?]", "org[subdomain]"
    end
  end
end
