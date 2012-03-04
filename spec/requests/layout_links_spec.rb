require 'spec_helper'

describe "LayoutLinks" do
    it "should have correct links" do
      visit root_path
      click_link "About"
      response.should have_selector('title', :content => "About")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      click_link "Help"
      response.should have_selector('title', :content => "Help")
    end

    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Sign up")
    end

end
