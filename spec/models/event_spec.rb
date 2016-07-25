require 'rails_helper'

RSpec.describe Event, type: :model do
  let!( :event1 ) { FactoryGirl.create( :event ) }
  let!( :event2 ) { FactoryGirl.create( :event, date: "2001-01-01 00:00:00" ) }
  let!( :event3 ) { FactoryGirl.create( :event, host: "Nike", date: "2002-01-01 00:00:00" ) }

  context "happy path", use_transactions: false do

    it{ expect( Event.search_the_last(2).where( host: "Reebok" ).size ).to be( 2 ) }
    it{ expect( Event.search_the_last(2).where( host: "Reebok" ) ).to match_array( [ event2, event1 ] ) }

    it{ expect( Event.search_the_last(2) ).to match_array( [ event3, event2 ] ) }

  end

  context "unhappy path", use_transactions: false do

    it{ expect( Event.search_the_last(2).where( host: "Reebok" ).size ).to_not be( 1 ) }
    it{ expect( Event.search_the_last(2).where( host: "Reebok" ).size ).to_not be( 3 ) }
    it{ expect( Event.search_the_last(2).where( host: "Reebok" ) ).to_not eq( [ event1, event2 ] ) }
    it{ expect( Event.search_the_last(2).where( host: "Reebok" ) ).to_not include( event3 ) }

    it{ expect( Event.search_the_last(2) ).to_not eq( [ event2, event3 ] ) }
    it{ expect( Event.search_the_last(2) ).to_not eq( [ event1, event3 ] ) }
    it{ expect( Event.search_the_last(2) ).to_not eq( [ event3, event1 ] ) }
    it{ expect( Event.search_the_last(2) ).to_not eq( [ event3, event3 ] ) }

  end

end

