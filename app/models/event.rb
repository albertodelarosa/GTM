class Event < ActiveRecord::Base
  def self.search_the_last( limit )
    order( :date ).limit( limit ).reverse_order
  end
end

