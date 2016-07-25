require 'rails_helper'

RSpec.describe "orgs/index", type: :view do
  before(:each) do
    assign(:orgs, [
      Org.create!(
        :name => "Name",
        :subdomain => "Subdomain"
      ),
      Org.create!(
        :name => "Name",
        :subdomain => "Subdomain"
      )
    ])
  end

  it "renders a list of orgs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
  end
end
