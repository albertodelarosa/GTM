class Org < ActiveRecord::Base
  after_create :add_subdomain

  def switch!( sub )
    Apartment::Tenant.switch!( sub )
  end

  private

  def add_subdomain
    Apartment::Tenant.create(subdomain)
  end
end

