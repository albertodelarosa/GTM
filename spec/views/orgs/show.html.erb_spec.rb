require 'rails_helper'

RSpec.describe "orgs/show", type: :view do
  before(:each) do
    @org = assign(:org, Org.create!(
      :name => "Name",
      :subdomain => "Subdomain"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Subdomain/)
  end
end
