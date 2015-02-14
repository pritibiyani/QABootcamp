require_relative '../src/ProductPage'
require 'forwardable'

class SubCategoryPage
  extend Forwardable

  def_delegator :@menu, :select_category_and_subcategory
  def_delegator :@menu, :select_category

  def initialize driver, name
    @name   = name
    @driver = driver
    @menu   = Menu.new @driver
  end

  def on_subcategory_page?
    get_url.include? @name
  end

  def choose_product product_name
    element = find_element_by_partial_link_text product_name
    element.click
    ProductPage.new @driver, product_name
  end

  def get_url
    @driver.current_url
  end

  def find_element_by_partial_link_text link_text
    @driver.find_element(:partial_link_text, link_text)
  end

  def get_analytics
    execute_script expected_analytics.keys.first.to_s
  end

  def expected_analytics
    {:catalogId => 12605}
  end

  def execute_script data
    data = @driver.execute_script("return window.shc.#{data}")
    data
  end

end