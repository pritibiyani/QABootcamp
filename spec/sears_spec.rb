require 'spec_helper'
require_relative '../src/HomePage'
require_relative '../src/SubCategoryPage'

describe 'Test Sears website' do
  before(:all) do
    @driver   = Selenium::WebDriver.for :firefox
#    wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
    @base_url = 'http://www.sears.com/'
  end

  it 'should select Catagory' do
    selection_criteria_one = {:category => 'Fitness', :sub_category => 'Apparel', :product => 'Maui and Sons Child Type V Life Vest - Green'}
    selection_criteria_two = {:category => 'Home', :sub_category => 'Bedding'}
    homepage               = HomePage.new(@driver)
    homepage.navigate_to_home_page(@base_url)
    sub_category = homepage.select_category_and_subcategory selection_criteria_one[:category], selection_criteria_one[:sub_category]
    # expect (sub_category.on_subcategory_page?).to be true
    product_page = sub_category.choose_product selection_criteria_one[:product]
    # expect (product_page.on_product_page?).to be true
    product_page.select_category_and_subcategory selection_criteria_two[:category], selection_criteria_two[:sub_category]
  end

  after(:all) do
    # @driver.close
  end

end