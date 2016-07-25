require 'rails_helper'

RSpec.describe Org, type: :model do

  context "public domain" do
    before do
      Apartment::Tenant.switch!
    end

    it{ expect( Apartment::Tenant.current ).to include( "public" ) }
  end

  context "custom domain" do
    before do
      Apartment::Tenant.switch!("newrelic")
    end

    it{ expect( Apartment::Tenant.current ).not_to include( "public" ) }
    it{ expect( Apartment::Tenant.current ).not_to include( "oldrelic" ) }
    it{ expect( Apartment::Tenant.current ).to include( "newrelic" ) }
  end

end

