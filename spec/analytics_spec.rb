require 'spec_helper'
require_relative '../src/HomePage'
require_relative '../src/SubCategoryPage'
require_relative '../src/CategoryPage'

describe 'Test Sears website' do
  before(:all) do
    @driver   = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
#    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    @base_url = 'http://www.sears.com/'
  end

  context 'check analytics' do
    it 'should check analytics on category page' do
      category = 'Appliances'
      homepage = HomePage.new(@driver)
      homepage.navigate_to_home_page(@base_url)
      category = homepage.select_category category
      expect(category.get_analytics).to eq ['Appliances']
    end

    it 'should check analytics on sub category page' do
      selection = {:category => 'Appliances', :sub_category=> 'Heating' }
      homepage = HomePage.new(@driver)
      homepage.navigate_to_home_page(@base_url)
      category = homepage.select_category_and_subcategory selection[:category], selection[:sub_category]
      expect(category.get_analytics).to eq '12605'
    end
  end
  after(:all) do
    @driver.close
  end

end