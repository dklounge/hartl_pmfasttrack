require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Product Management') }
    it { should have_title("PM Fast Track") }
    it { should_not have_title('| Home') }
  end

  describe "Events page" do
    before { visit events_path }

    it { should have_content('Events') }
    it { should have_title("PM Fast Track | Events") }
  end

  describe "About page" do

    it "should have the h1 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("PM Fast Track | About Us")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("PM Fast Track | Contact")
    end
  end
end
