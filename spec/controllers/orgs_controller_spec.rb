require 'rails_helper'

RSpec.describe OrgsController, type: :controller do

  let!( :event1 ) { FactoryGirl.create( :event, host: "Nike" ) }
  let!( :event2 ) { FactoryGirl.create( :event, name: "event2", host: "Nike", date: "2001-01-01 00:00:00" ) }
  let!( :event3 ) { FactoryGirl.create( :event, name: "event3", host: "Reebok", date: "2002-01-01 00:00:00" ) }

  context "happy path" do

    describe "GET #index without params" do
      before(:each) { get :index }

      it{ expect( assigns( :found_events ) ).to be nil }
    end

    describe "GET #index with full params" do
      before(:each) { get :index, { "/orgs" => { limit: 2, host: "Nike" } } }

      it{ expect( assigns( :found_events ) ).to eq( [ event2, event1 ] ) }
      it{ expect( assigns( :found_events ).size ).to eq( 2 ) }
    end

    describe "GET #index without host params" do
      before(:each) { get :index, { "/orgs" => { limit: 2 } } }

      it{ expect( assigns( :found_events ).size ).to eq( 2 ) }
      it{ expect( assigns( :found_events ) ).to eq( [ event3, event2 ] ) }
    end

  end


  context "unhappy path" do

    describe "GET #index without params" do
      before(:each) { get :index }

      it{ expect( assigns( :found_events ) ).to_not eq( [ event2 ] ) }
      it{ expect( assigns( :found_events ) ).to_not eq( 2 ) }

    end

    describe "GET #index with full params" do
      before(:each) { get :index, { "/orgs" => { limit: 2, host: "Nike" } } }

      it{ expect( assigns( :found_events ).size ).to_not eq( 1 ) }
      it{ expect( assigns( :found_events ).size ).to_not eq( 3 ) }

      it{ expect( assigns( :found_events ) ).to_not eq( [ event2, event3 ] ) }
    end

    describe "GET #index without host params" do
      before(:each) { get :index, { "/orgs" => { limit: 2 } } }

      it{ expect( assigns( :found_events ).size ).to_not eq( 1 ) }
      it{ expect( assigns( :found_events ).size ).to_not eq( 3 ) }
      it{ expect( assigns( :found_events ) ).to_not eq( [ event2, event1 ] ) }
      it{ expect( assigns( :found_events ) ).to_not eq( [ event3, event1 ] ) }
    end

  end

end

